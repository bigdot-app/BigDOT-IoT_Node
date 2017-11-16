/**
  ******************************************************************************
  * @file    rfu.c
  * @author  MCD Application Team
  * @version V1.0.0
  * @date    28-March-2017
  * @brief   Remote firmare upate over TCP/IP.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2017 STMicroelectronics International N.V. 
  * All rights reserved.</center></h2>
  *
  * Redistribution and use in source and binary forms, with or without 
  * modification, are permitted, provided that the following conditions are met:
  *
  * 1. Redistribution of source code must retain the above copyright notice, 
  *    this list of conditions and the following disclaimer.
  * 2. Redistributions in binary form must reproduce the above copyright notice,
  *    this list of conditions and the following disclaimer in the documentation
  *    and/or other materials provided with the distribution.
  * 3. Neither the name of STMicroelectronics nor the names of other 
  *    contributors to this software may be used to endorse or promote products 
  *    derived from this software without specific written permission.
  * 4. This software, including modifications and/or derivative works of this 
  *    software, must execute solely and exclusively on microcontroller or
  *    microprocessor devices manufactured by or for STMicroelectronics.
  * 5. Redistribution and use of this software other than as permitted under 
  *    this license is void and will automatically terminate your rights under 
  *    this license. 
  *
  * THIS SOFTWARE IS PROVIDED BY STMICROELECTRONICS AND CONTRIBUTORS "AS IS" 
  * AND ANY EXPRESS, IMPLIED OR STATUTORY WARRANTIES, INCLUDING, BUT NOT 
  * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A 
  * PARTICULAR PURPOSE AND NON-INFRINGEMENT OF THIRD PARTY INTELLECTUAL PROPERTY
  * RIGHTS ARE DISCLAIMED TO THE FULLEST EXTENT PERMITTED BY LAW. IN NO EVENT 
  * SHALL STMICROELECTRONICS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
  * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
  * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, 
  * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
  * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
  * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
  * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>
#include "main.h"
#include "rfu.h"
#include "network.h"
#include "simpleformat.h"
#include "flash.h"
#include "iot_flash_config.h"
#include "version.h"
    
/* Private defines -----------------------------------------------------------*/
#define HTTP_MAX_HOST_SIZE        80      /**< Max length of the http server hostname. */
#define HTTP_MAX_QUERY_SIZE       50      /**< Max length of the http query string. */
#define HTTP_HEADER_BUFFER_SIZE   150     /**< Size of the HTTP send buffer. Only the header for a GET request. */
#define HTTP_READ_BUFFER_SIZE     1050    /**< Size of the HTTP receive buffer.
                                               Must be larger than the HTTP response header length. That is about 250 bytes. */

/* #define URL_TRACE */       /**< Activate the URL decoding trace. */
/* #define DL_TRACE  */       /**< Activate the HTTP file download trace. */
/* #define FF_TRACE  */       /**< Activate the firmware file format decoding trace. */
/* #define SKIP_WRITING */    /**< Prevent writing the downloaded firmware into FLASH. Used for debug. */
 
/** Will only receive the simple format headers. Not need to be as large as a FLASH page. */
#define RFU_READBUF_SIZE          MAX(MAX(MAX(sizeof(sff_fileheader_t),\
                                      sizeof(sff_datarecord_t)),\
                                      sizeof(sff_entryrecord_t)),\
                                      sizeof(sff_endrecord_t))

/** Translate a ROM address to the other FLASH bank. */
#define ALT_BANK(a)     ( ((a) >= (FLASH_BASE + FLASH_BANK_SIZE)) ? ((a) - FLASH_BANK_SIZE) : ((a) + FLASH_BANK_SIZE) )
                                        
#define ROUND_DOWN(a,b) ( ((a) / (b)) * (b) )
#define MIN(a,b)        ( ((a)<(b)) ? (a) : (b) )
#define MAX(a,b)        ( ((a)<(b)) ? (b) : (a) )
      

/* Private typedef -----------------------------------------------------------*/
/** 
 * @brief HTTP progressive download internal session context. 
 */
typedef struct {
  int net_fd;                         /**< Network socket handle. */
  char query[HTTP_MAX_QUERY_SIZE];    /**< HTTP query parsed from the URL. Must be resent in each range request. */
  char hostname[HTTP_MAX_HOST_SIZE];  /**< HTTP full qualified server name. Must be resent in each range request. */ 
} http_rfu_context_t;

/**
 * @brief HTTP progressive download socket emulation context.
 */
typedef struct {
  http_rfu_handle_t http_rfu_hnd;   /**< HTTP progressive download handle. */
  int read_pos;                     /**< Offset to the last byte read from the socket. */
  int res_size;                     /**< Size of the resource being downloaded. Constant for a static file. */
} http_rfu_sock_context_t;


/* Private variables ----------------------------------------------------------*/
/** Important: lFwVersion must be stored at an address which persists through the FW builds. */


#ifdef __ICCARM__  /* IAR */
const firmware_version_t lFwVersion @ "INITED_FIXED_LOC" = { FW_VERSION_MAJOR, FW_VERSION_MINOR, FW_VERSION_PATCH, __DATE__, __TIME__ };
#elif defined ( __CC_ARM   ) /* Keil / armcc */
const firmware_version_t lFwVersion __attribute__((section("INITED_FIXED_LOC"))) = { FW_VERSION_MAJOR, FW_VERSION_MINOR, FW_VERSION_PATCH, __DATE__, __TIME__ };
#elif defined ( __GNUC__ )      /*GNU Compiler */
const firmware_version_t lFwVersion __attribute__((section("INITED_FIXED_LOC"))) = { FW_VERSION_MAJOR, FW_VERSION_MINOR, FW_VERSION_PATCH, __DATE__, __TIME__ };
#endif


/** Important: lUserConfig must be stored at a persistent address, in a FLASH area which is not initialized by the flashloader. */
extern const user_config_t lUserConfig;


/* Private function prototypes -----------------------------------------------*/
int http_url_parse(char * const host, const int host_max_len, int * const port, char * const query, const int query_max_len, const char * url);
#ifdef RFU
static void sum_update(uint32_t * const checksum, const void * const address, const int size);
static uint16_t getShortFromArray(const uint8_t * const data);
static uint32_t getWordFromArray(const uint8_t * const data);
static void print_fileheader(const sff_fileheader_t * const pFileHeader);
static void print_datarecord(const sff_datarecord_t * const pRecord);
static void print_entryrecord(const sff_entryrecord_t * const pRecord);
static void print_endrecord(const sff_endrecord_t * const pRecord);
#endif /* RFU */


/* Functions Definition ------------------------------------------------------*/

/**
 * @brief   Get the version info of the running firmware.
 * @param   Out: version    Allocated by the caller.
 * @retval  Error code
 *            RFU_OK   (0)  Success
 *            RFU_ERR (<0)  Failure
 */
int rfu_getVersion(firmware_version_t const ** const version, bool alt)
{
  int ret = RFU_OK;
  
  if (alt == true)
  {
#ifdef RFU
    *version = (firmware_version_t *) ALT_BANK( (uint32_t) &lFwVersion );
#else
    ret = RFU_ERR;
#endif
  }
  else
  {
    *version = &lFwVersion;
  }
  
  return ret;
}

#ifdef RFU
/**
 * @brief   Update the cumulated sum of the firmware file being downloaded.
 * @note    The checksum initialization is the caller responsibility.
 * @param   In/Out: checksum    Cumulated byte sum.
 */
static void sum_update(uint32_t * const checksum, const void * const address, const int size)
{
  uint8_t * buffer = (uint8_t *) address;
  for (int i = 0; i < size; i++)
  {
    *checksum += buffer[i];
  }
}


/**
 * @brief   Download a firmware image from an HTTP server into the alternate FLASH bank.
 * @note    The current program, as well as the update, must fit in a single bank of the embedded FLASH:
 *          [0x08000000 - 0x08080000] on STM32L745.
 * @note    The HTTP server must support the "Range:" request header. This is the case with HTTP/1.1.
 * @param   In: url    Location of the new firmware (HTTP url: "http://<hostname>:<port>/<path>")
 * @retval  Error code
 *             RFU_OK (0) Success.
 *             <0         Failure.
 *                          RFU_ERR_HTTP  Error downloading over HTTP.
 *                          RFU_ERR_FF    Error decoding the simple code file format.
 *                          RFU_ERR_FLASH Error erasing or programmig the FLASH memory.
 */
int rfu_update(const char * const url)
{
  int rc = RFU_OK;
  int ret = 0;
  
  uint32_t sum = 0;
  
  http_rfu_handle_t httpHnd;
  http_rfu_sock_handle_t sockHnd;
  uint8_t readbuffer[RFU_READBUF_SIZE];
  memset(readbuffer, 0, RFU_READBUF_SIZE);

  ret = http_open(&httpHnd, url);
  if (RFU_OK != ret) {
    printf("Error opening %s\n", url);
    rc = RFU_ERR_HTTP;
  }
  else
  {
    ret = http_sock_open(&sockHnd, httpHnd);
  }
  
  if (RFU_OK != ret) {
    printf("Error allocating a progressive download socket.\n");
  }
  else
  { 
    /* Read the file header and the first record header */
    if ( sizeof(sff_fileheader_t) != http_sock_rcv(readbuffer, sizeof(sff_fileheader_t), sockHnd) )  
    {
      rc = RFU_ERR_HTTP;
      printf("Error: Could not read %d bytes from HTTP.\n", RFU_READBUF_SIZE);
    }
    else
    { /* Has read as many bytes as sent by the server. */
      sff_fileheader_t *file_header = (sff_fileheader_t *) readbuffer;
#ifdef FF_TRACE
      print_fileheader(file_header);
#endif /* FF_TRACE */
      sum_update(&sum, file_header, sizeof(sff_fileheader_t));

      uint32_t word = getWordFromArray(file_header->magic_number);
      if (word != 0x7f494152)
      {
        printf("Wrong file format: Does not start with the simple-code magic number 0x7f494152.\n");
        print_fileheader(file_header);
        rc = RFU_ERR_FF;
      }
    }
    
    if (RFU_OK == rc)
    { /* This is an IAR simple-code binary file. */
      bool b_EOF = false; /* Denotes when the HTTP server reaches the end of the file.*/
      do {  
        /* Walk through the record headers.
         * Read the record type, then the record header, and - if applicable - the record data.
         * Write the record data to the FLASH.
         * Keep the checksum updated.
         * Note: The record header contents are stored in network byte order (big endian).
         * Leave the loop upon error, or once the end record and end of file is reached.
         */
        if ( 1 != http_sock_rcv(readbuffer, 1, sockHnd) )
        {
          printf("Error: Could not read the record type\n");
          rc = RFU_ERR_HTTP;
          break;
        }
        
        switch ( readbuffer[0] )
        {
          case SFF_DATA_RECORD:
            {
              if ( (sizeof(sff_datarecord_t) - 1) != http_sock_rcv(readbuffer + 1, sizeof(sff_datarecord_t) - 1, sockHnd) ) 
              {
                printf("Error: Could not read a data record header\n");
                rc = RFU_ERR_HTTP;
                break;
              }
              sff_datarecord_t *record = (sff_datarecord_t *) readbuffer;
              
              sum_update(&sum, record, sizeof(sff_datarecord_t));
#ifdef FF_TRACE              
              print_datarecord(record);
#else
              (void)print_datarecord; /* avoid warning */
#endif /* FF_TRACE */           

              uint32_t dst_size = getWordFromArray(record->number_of_program_bytes);
              uint32_t dst_address = getWordFromArray(record->record_start_address);
              
              /* Load and update the FLASH pages from: record_start_address to: record_start_address + number_of_program_bytes.
               * Loop on the page count, with an HTTP ranged GET each.
               * Keep the checksum updated. */
              
              /* Allocate a page buffer as the output of the HTTP download.
               * It must be aligned on 64b boundaries to match the FLASH programming alignment constraints. */
              uint64_t page_cache[FLASH_PAGE_SIZE/sizeof(uint64_t)];  

              /* Align the FLASH programming on page boundaries to prevent an additional erase-write cycle. */
              /* After the boot bank switch, at reset time, the 0x00000000 alias will point to the alternate bank. So we write there. */
              int ret = 0;
              int remaining = dst_size;
   
              do {
                uint32_t user_addr = ALT_BANK(dst_address);                 /* Program address in the destination bank. */
                uint32_t fl_addr = ROUND_DOWN(user_addr, FLASH_PAGE_SIZE);  /* Start address of the page. */
                int fl_offset = user_addr - fl_addr;                        /* Offset to the start of the chunk to be updated in this page. */
                int len = MIN(FLASH_PAGE_SIZE - fl_offset, remaining);      /* Bytes to be updated in this page. */
#ifdef FL_TRACE
                printf("fl_offset:%d, len:%d\n", fl_offset, len);
#endif /* FL_TRACE */
                
                /* Load from the flash into the cache */
                memcpy(page_cache, (void *) fl_addr, FLASH_PAGE_SIZE);  
                
                /* Update the cache from the source */
#ifdef DL_TRACE
                printf("Going to read %d bytes, into 0x%08x.\n", len, (uint8_t *)fl_addr + fl_offset);
#endif /* DL_TRACE */
                int hret = http_sock_rcv((uint8_t *)page_cache + fl_offset, len, sockHnd);
                if ( len != hret )
                {
                  printf("Error: Could not read as many program bytes as requested (%d != %d)\n", hret, len);
                  rc = RFU_ERR_HTTP;
                  break;
                }
                sum_update(&sum, (uint8_t *)page_cache + fl_offset, len);
                
                /* Erase the page, and write the cache */
#ifndef SKIP_WRITING
#ifdef FL_TRACE
                printf("Erasing at 0x%08x\n", fl_addr);
#endif /* FL_TRACE */
                ret = FLASH_unlock_erase(fl_addr, FLASH_PAGE_SIZE);
                if (ret != 0)
                {
                  printf("Error when erasing the FLASH at: 0x%08lx\n", fl_addr);
                  rc = RFU_ERR_FLASH;
                }
                else
                {
                  ret = FLASH_write_at(fl_addr, page_cache, FLASH_PAGE_SIZE);
                }
#endif /* SKIP_WRITING */                  
                if (ret != 0)
                {
                  printf("Error when programming the FLASH at: 0x%08lx\n", fl_addr);
                  rc = RFU_ERR_FLASH;
                }
                else
                {
                  remaining -= len;
                  dst_address += len;
                }
              } while ((ret == 0) && (remaining > 0));
              break;
            }
          case SFF_ENTRY_RECORD:
            { 
              if ( (sizeof(sff_entryrecord_t) - 1) != http_sock_rcv(readbuffer + 1, sizeof(sff_entryrecord_t) - 1, sockHnd) ) 
              {
                rc = RFU_ERR_HTTP;
                break;
              }
              sff_entryrecord_t *record = (sff_entryrecord_t *) readbuffer;
              sum_update(&sum, record, sizeof(sff_entryrecord_t));
#ifdef FF_TRACE
              print_entryrecord(record);
#else
              (void)print_entryrecord; /* avoid warning */
#endif /* FF_TRACE */
              /* Assuming that there is nothing to do with the entry record. The boot address is fixed to 0x08000000. */
              break;
            }
          case SFF_END_RECORD:
            {
              if ( (sizeof(sff_endrecord_t) - 1) != http_sock_rcv(readbuffer + 1, sizeof(sff_endrecord_t) - 1, sockHnd) )
              {
                rc = RFU_ERR_HTTP;
                break;
              }
              sff_endrecord_t *record = (sff_endrecord_t *) readbuffer;
              sum_update(&sum, record, &record->checksum[0] - &record->record_tag);  /* Exclude the checksum field from the computation. */
#ifdef FF_TRACE
              print_endrecord(record);
#else
              (void)print_endrecord; /* avoid warning */
#endif /* FF_TRACE */
              uint32_t word = getWordFromArray(record->checksum);
              
              if ((sum + word) != 0)
              {
                printf("Error: File checksum test failed (%lu)\n", sum + word);
                rc = RFU_ERR_FF;
              }
              b_EOF = true;
              break;
            }
          case SFF_INVALID_RECORD:
          default:
            printf("File format parsing error: unknown record tag %x\n", readbuffer[0]);
            rc = RFU_ERR_FF;
        }
      } while ( (rc == RFU_OK) && (! b_EOF ) );
    }
    
    if (rc == RFU_OK)
    {
      const firmware_version_t  * fw_version, * alt_fw_version;
      rfu_getVersion(&fw_version, false);
      rfu_getVersion(&alt_fw_version, true);
#ifdef FL_TRACE
      printf("Cur FW Version: %u.%u.%u %s %s\n", fw_version->major, fw_version->minor, fw_version->patch, fw_version->build_date, fw_version->build_time);
      printf("Alt FW Version: %u.%u.%u %s %s\n", alt_fw_version->major, alt_fw_version->minor, fw_version->patch, alt_fw_version->build_date, alt_fw_version->build_time);
#endif /* FL_TRACE */

       
      /* Copy the static user settings to the alternate bank.
       * The user settings location and contents format MUST be the same in the current FW and in the new FW. */
#ifndef SKIP_WRITING
      FLASH_update(ALT_BANK((uint32_t)&lUserConfig), &lUserConfig, sizeof(user_config_t)); 
#endif /* SKIP_WRITING */
    }
  }

  HAL_FLASH_Lock();
  
  http_sock_close(sockHnd);
  http_close(httpHnd);
  return rc;
}

#endif /* RFU */

/**
 * @brief   Open an HTTP progressive download session.
 * @note    The internal session context is allocated by the callee.
 * @param   In: pHnd    Pointer on the session handle.
 * @param   In: url     Source of the progressive download. e.g. http://john.doe:80/foo.bar
 * @retval  Error code
 *            RFU_OK   (0)  Success
 *            RFU_ERR (<0)  Failure
 */
int http_open(http_rfu_handle_t * const pHnd, const char *url)
{
  http_rfu_context_t * pCtx = 0;
  int port;

  pCtx = (http_rfu_context_t *) malloc(sizeof(http_rfu_context_t));

  if (pCtx != NULL)
  {
    if (RFU_OK == http_url_parse(pCtx->hostname, HTTP_MAX_HOST_SIZE, &port, pCtx->query, HTTP_MAX_QUERY_SIZE, url))
    {
      if (network_connect((void*) &pCtx->net_fd,(const char *) pCtx->hostname, port) == 0)
      {
        *pHnd = (http_rfu_handle_t) pCtx;
        return RFU_OK;
      }
    }

    free(pCtx);
  }
  return RFU_ERR;
}


/**
 * @brief   Close an HTTP progressive download session.
 * @note    The internal session context is freed by the callee.
 * @param   In: hnd   Session handle.
 * @retval  Error code
 *            RFU_OK   (0)  Success
 *            RFU_ERR (<0)  Failure
 */
int http_close(const http_rfu_handle_t hnd)
{
  int rc = RFU_ERR;
  
  http_rfu_context_t * pCtx = (http_rfu_context_t *) hnd;
  if (pCtx != NULL)
  {
    char http_request[HTTP_HEADER_BUFFER_SIZE];  
    int send_bytes = snprintf(http_request, HTTP_HEADER_BUFFER_SIZE,
        "Connection: close\r\n\r\n");
  
    if (send_bytes < HTTP_HEADER_BUFFER_SIZE - 1)
    {
      int ret = network_socket_send((void*)pCtx->net_fd, (uint8_t *) http_request, send_bytes);
      if (ret != send_bytes)
      {
        printf("Error: Could not close the HTTP connection properly.\n");
      }
      else
      {
        rc = RFU_OK;    
      }
    }

    network_socket_close(pCtx->net_fd);
    free(pCtx);
  }
  
  return rc;
}

/**
 * @brief   Read from an HTTP progressive download session.
 * @param   Out: readbuffer Output buffer.
 * @param   Out: status     HTTP range download status. 
 * @param   In: offset      Offset (in bytes) from the start of the remote resource to read from. 
 * @param   In: size        Size of the chunk to read.
 * @param   In: hnd         Session handle.
 * @retval  >=0 Success: Number of bytes copied to readbuffer.
 *           <0 Error:
 *                RFU_ERR       Bad input parameter.  
 */
int http_read(uint8_t * const readbuffer, http_range_status_t * const status, const int offset, const int size, const http_rfu_handle_t hnd)
 {
  int rc = RFU_OK;
  int file_bytes = 0;
  http_rfu_context_t * pCtx = (http_rfu_context_t *) hnd;

  if ((pCtx == NULL) || (readbuffer == NULL))
  {
    rc = RFU_ERR;
  }
  else
  {
    char http_request[HTTP_HEADER_BUFFER_SIZE];  
    
    int send_bytes = snprintf(http_request, HTTP_HEADER_BUFFER_SIZE,
        "GET /%s HTTP/1.1\r\n"
        "Host: %s\r\n"
        "Range: bytes=%d-%d\r\n\r\n",
        pCtx->query, pCtx->hostname, offset, offset + size - 1);
  
    if (send_bytes < HTTP_HEADER_BUFFER_SIZE - 1)
    {
      rc = network_socket_send((void*)pCtx->net_fd, (uint8_t *) http_request, send_bytes);
      if (rc == send_bytes)
      {
        int rcv_bytes = 0;
        int ret = 0;
        uint8_t l_readbuffer[HTTP_READ_BUFFER_SIZE + 50]; /* + 50 is a workaround for the xWIFI_Socket_Recv ABW bug. */
        
        memset(l_readbuffer, 0, HTTP_READ_BUFFER_SIZE);
        
        do {
          int ret = network_socket_recv((void*)pCtx->net_fd, l_readbuffer, HTTP_READ_BUFFER_SIZE);
          if (ret >= 0)
          { 
            //printf("Read %d bytes into the local readbuffer; %d/%d\n", ret, file_bytes, size);
            if (rcv_bytes == 0)
            { 
              /* Received the first buffer.*/
              uint8_t *pRange = NULL;
              rcv_bytes += ret; 
              
              /* Return the Content-Range header into status */
              if (status != NULL)
              { 
                pRange = (uint8_t *) strstr((char const *)l_readbuffer, "Content-Range: bytes ");
                if (pRange == NULL)
                {
                  ret = -1;
                  printf("HTTP parse error: could not find the Content-range header\n");
                }
                else
                {
                  pRange += strlen("Content-Range: bytes ");
                  if (3 != sscanf((char const *)pRange, "%u-%u/%u", &status->first_byte, &status->last_byte, &status->resource_size))
                  {
                    uint32_t resource_size = 0;
                    if (1 != sscanf((char const *)pRange, "*/%lu", &resource_size))
                    {
                      ret = -1;
                      printf("HTTP parse error: could not parse the Content-range header\n");
                    }
                    else
                    { /* Out of range request */
                      printf("Out of range request: %d-%d / %lu\n", offset, offset+size-1, resource_size);
                      printf("Previous range status: %d-%d / %d\n", status->first_byte, status->last_byte, status->resource_size);
                      ret = -1;
                    }
                  }
                }
              }
              
              if (ret >= 0)
              {
                /* Find the start of the body */
                pRange = (uint8_t *) strstr((char const *)l_readbuffer, "\r\n\r\n");
                if (pRange != NULL)
                {
                  pRange += strlen("\r\n\r\n");
                  int write_size = MIN(ret - (pRange - l_readbuffer), size);
                  memcpy(&readbuffer[file_bytes], pRange, write_size);
                  file_bytes += write_size;
                }
              }
            }
            else
            { 
              /* Received the next buffer.*/
              rcv_bytes += ret;
              int write_size = MIN(ret, size - file_bytes);
              memcpy(&readbuffer[file_bytes], l_readbuffer, write_size);
              file_bytes += write_size;
            }
          }
        } while (((ret >= 0) || (ret == MBEDTLS_ERR_SSL_WANT_READ)) && (file_bytes < size)); // TODO: Need a timeout or a loop limit to increase the resilience to network errors.
        
        if (ret < 0) 
        {
          printf("Error: wifi_socket_recv() returned %d\n", ret);
        }
      } 
    }
    else
    { 
      /* Buffer overflow: The passed URL is too long.*/
      rc = RFU_ERR;
    }
  }
  printf("returning with range status: %u-%u / %u\n", status->first_byte, status->last_byte, status->resource_size);
  return (rc < 0) ? rc : file_bytes;
}


/**
 * @brief   Parse and split an http url into hostname/port number/query string.
 * @param   Out: host           Hostname. Allocated by the caller.
 * @param   In:  host_max_len   Maximum length of the hostname.
 * @param   Out: port           Port number.
 * @param   Out: query          HTTP query. Allocated by the caller.
 * @param   In:  query_max_len  Maximum length of the query.
 * @param   In:  url            URL to be parsed.
 * @retval  Error code
 *            RFU_OK   (0)  Success
 *            RFU_ERR (<0)  Failure
 */
int http_url_parse(char * const host, const int host_max_len, int * const port, char * const query, const int query_max_len, const char * url)
{
  bool has_query = true;

#ifdef URL_TRACE
  printf("url: %s\n", url);
#endif

  memset(host, 0, host_max_len);
  memset(query, 0, query_max_len);

#define HT_PX  "http://"
  if (0 == strncmp(url, HT_PX, strlen(HT_PX)))
  {
    const char *pc = url + strlen(HT_PX);
    char *pHostTailCol = strchr(pc, ':');
    char *pHostTailSla = strchr(pc, '/');
    if ((pHostTailCol <= pHostTailSla) && (pHostTailCol != NULL))
    {
      /*host = */strncpy(host, pc, MIN(pHostTailCol - pc, host_max_len));
      pc = pHostTailCol + 1;
      sscanf(pc, "%d", port);
      pc = strchr(pc, '/');
      if (pc != NULL)
      {
        pc++;
      } else
      {
        has_query = false;
      }
    } else
    {
      if (pHostTailSla != NULL)
      {
        strncpy(host, pc, MIN(pHostTailSla - pc, host_max_len));
        pc = pHostTailSla + 1;
      } else
      {
        /*host = */strncpy(host, pc, host_max_len);
        has_query = false;
      }
      *port = 80;
    }
    if (has_query)
    {
      /*query = */strncpy(query, pc, query_max_len);
    }

#ifdef URL_TRACE
    printf("http host: %s\n", host);
    printf("http port: %d\n", *port);
    printf("http query: %s\n", query);
#endif

    return RFU_OK;
  } else
  {       
    /* Not an HTTP url. */
    return RFU_ERR;
  }
}

#ifdef RFU
/**
 * @brief   Get a short from a 2 byte network-endian array.
 * @param   In: Byte array.
 * @return  half word
 */
static uint16_t getShortFromArray(const uint8_t * const data)
{
  uint16_t half = 0;
  if (data != NULL)
  {
    half = data[0] << 8 | data[1];
  }
  return half;
}

/**
 * @brief   Get a word from a 4 byte network-endian array.
 * @param   In: Byte array.
 * @return	word
 */
static uint32_t getWordFromArray(const uint8_t * const data)
{
  uint32_t word = 0;
  if (data != NULL)
  {
    word = data[0] << 24 | data[1] << 16 | data[2] << 8 | data[3];
  }
  return word;
}

/**
 * @brief   Print a simple file format file header.
 * @param   In: pFileHeader   File header.
 */
static void print_fileheader(const sff_fileheader_t * pFileHeader) 
{
  if (pFileHeader != NULL)
  {
    uint32_t word = getWordFromArray(pFileHeader->magic_number);
    printf("magic_number: 0x%08lx\n", word);

    word = getWordFromArray(pFileHeader->program_flags);
    printf("program_flags: 0x%08lx\n", word);

    word = getWordFromArray(pFileHeader->number_of_program_bytes);
    printf("number_of_program_bytes: %lu\n", word);

    uint16_t half = getShortFromArray(pFileHeader->version_information);
    printf("version_information: 0x%04x\n", half);
  }
}

/**
 * @brief   Print a simple file format data record header.
 * @param   In: pRecord     Data record header.
 */
static void print_datarecord(const sff_datarecord_t * pRecord) 
{
  if (pRecord != NULL)
  {
    int record_match = 0;
    printf("\nrecord_tag: 0x%x", pRecord->record_tag);
    switch (pRecord->record_tag)
    {
      case SFF_DATA_RECORD:
        printf(" - DATA_RECORD\n");
        record_match = 1;
        break;
      case SFF_ENTRY_RECORD:
        printf(" - ENTRY_RECORD\n");
        break;
      case SFF_END_RECORD:
        printf(" - END_RECORD\n");
        break;
      case SFF_INVALID_RECORD:
      default:
        printf(" - INVALID_RECORD\n");
    }
    if (record_match == 1)
    {
      printf("segment_type: %d\n", pRecord->segment_type);

      uint16_t half = getShortFromArray(pRecord->record_flags);
      printf("record_flags: 0x%04x\n", half);

      uint32_t word = getWordFromArray(pRecord->record_start_address);
      printf("record_start_address: 0x%08lx\n", word);

      word = getWordFromArray(pRecord->number_of_program_bytes);
      printf("number_of_program_bytes: %lu 0x%lx\n", word, word);
    } else
    {
      printf("Error: mismatching record type.\n"); 
    }
  }
}

/**
 * @brief   Print a simple file format entry record header.
 * @param   In: pRecord     Entry record header.
 */
static void print_entryrecord(const sff_entryrecord_t * pRecord) 
{
  if (pRecord != NULL)
  {
    int record_match = 0;
    printf("\nrecord_tag: 0x%x", pRecord->record_tag);
    switch (pRecord->record_tag)
    {
      case SFF_DATA_RECORD:
        printf(" - DATA_RECORD\n");
        break;
      case SFF_ENTRY_RECORD:
        printf(" - ENTRY_RECORD\n");
        record_match = 1;
        break;
      case SFF_END_RECORD:
        printf(" - END_RECORD\n");
        break;
      case SFF_INVALID_RECORD:
      default:
        printf(" - INVALID_RECORD\n");
    }

    if (record_match == 1)
    {
      uint32_t word = getWordFromArray(pRecord->entry_address);
      printf("entry_address: 0x%08lx\n", word);

      printf("segment_type: %d\n", pRecord->segment_type);
    } else
    {
      printf("Error: mismatching record type.\n"); 
    }
  }
}

/**
 * @brief   Print a simple file format end record header.
 * @param   In: pRecord     End record header.
 */
static void print_endrecord(const sff_endrecord_t * pRecord) 
{
  if (pRecord != NULL)
  {
    int record_match = 0;
    printf("\nrecord_tag: 0x%x", pRecord->record_tag);
    switch (pRecord->record_tag)
    {
      case SFF_DATA_RECORD:
        printf(" - DATA_RECORD\n");
        break;
      case SFF_ENTRY_RECORD:
        printf(" - ENTRY_RECORD\n");
        break;
      case SFF_END_RECORD:
        printf(" - END_RECORD\n");
        record_match = 1;
        break;
      case SFF_INVALID_RECORD:
      default:
        printf(" - INVALID_RECORD\n");
    }
    if (record_match == 1)
    {
      uint32_t word = getWordFromArray(pRecord->checksum);
      printf("checksum: 0x%08lx\n", word);
    } else
    {
      printf("Error: mismatching record type.\n"); 
    }
  }
}
#endif /* RFU */

/**
 * @brief   Open a socket-like connection over the passed HTTP progressive download session.
 * @param   Out: http_sock_hnd  HTTP socket-like handle.
 * @param   In:  http_hnd       HTTP progressive download session handle.
 * @retval  Error code
 *            RFU_OK   (0)  Success
 *            RFU_ERR (-1)  Failure
 */
int http_sock_open(http_rfu_sock_handle_t * const http_sock_hnd, const http_rfu_handle_t http_hnd)
{
  int rc = RFU_ERR;
  http_rfu_sock_context_t * sock_ctx = malloc(sizeof(http_rfu_sock_context_t));
  
  if (sock_ctx != NULL)
  {
    sock_ctx->http_rfu_hnd = http_hnd;
    sock_ctx->read_pos = 0;
    sock_ctx->res_size = -1;
    *http_sock_hnd = (http_rfu_sock_handle_t) sock_ctx;
    rc = RFU_OK;
  }
  return rc;
}

/**
 * @brief   Close a socket-like connection.
 * @param   In:  http_sock_hnd   HTTP socket-like handle.
 * @retval  Error code
 *            RFU_OK   (0)  Success
 *            RFU_ERR (<0)  Failure
 */
int http_sock_close(const http_rfu_sock_handle_t http_sock_hnd)
{
  int rc = RFU_ERR;
  if (http_sock_hnd != NULL)
  {
    free(http_sock_hnd);
    rc = RFU_OK;
  }
  return rc;
}

/**
 * @brief   Receive data from an socket-like connection.
 * @param   Out: readbuffer     Destination buffer. Allocated by the caller.
 * @param   In:  size           Maximum length of the read data.
 * @param   In:  http_sock_hnd  HTTP socket-like handle.
 * @retval  >=0 Success: Number of bytes copied to the destination buffer.
 *           <0 Error:
 *                RFU_ERR       Bad input parameter.  
 *                RFU_ERR_HTTP  HTTP progressive download error.
 */
int http_sock_rcv(uint8_t *const readbuffer, const int size, const http_rfu_sock_handle_t http_sock_hnd)
{
  int rc = RFU_ERR;
  http_rfu_sock_context_t * sock_ctx = (http_rfu_sock_context_t *) http_sock_hnd;
  http_range_status_t httpRange = { 0, 0, 0 };
  
  printf("Requesting %d bytes from pos %d, out of %d\n", size, sock_ctx->read_pos, sock_ctx->res_size);
  if ((http_sock_hnd != NULL) && (readbuffer != NULL))
  {
    if ((sock_ctx->res_size >= 0) && (sock_ctx->read_pos + size > sock_ctx->res_size))
    { /* Not supported. The size of the downloaded resource is constant. */
      printf("Tried to read out of file.\n");
      rc = RFU_ERR_HTTP;
    }
    else
    {
      int hret = http_read(readbuffer, &httpRange, sock_ctx->read_pos, size, sock_ctx->http_rfu_hnd);
      if (hret >= 0)
      {
        if (sock_ctx->res_size < 0)
        { 
          /* Initialize it.*/
          sock_ctx->res_size = httpRange.resource_size;
        }
        sock_ctx->read_pos += hret;
        rc = hret;
      }
      else
      {
        rc = hret;
      }
    }
  }
  
  return rc;
}

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
