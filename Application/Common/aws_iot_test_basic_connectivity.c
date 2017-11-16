/*
* Copyright 2015-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
* http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

/**
  ******************************************************************************
  * @file    aws_iot_test_basic_connectivity.c
  * @author  MCD Application Team
  * @version V1.0.0
  * @date    28-March-2017
  * @brief   Integration Test for basic client connectivity
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
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include "main.h"
#include "network.h"
#include "timedate.h"
#include "heap.h"

#include "aws_iot_config.h"
#include "aws_iot_log.h"
#include "aws_iot_version.h"
#include "aws_iot_mqtt_client_interface.h"
#include "tls_params.h"
#include "iot_flash_config.h"
#include "rfu.h"
#include "aws_iot_test_basic_connectivity.h"
#include "msg.h"
#include "firewall_wrapper.h"
       
int subscribe_publish_sensor_values(void);

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Test topic to publish on */
#define INTEGRATION_TEST_TOPIC "Tests/Integration/EmbeddedC"

/* Number of messages to publish */
#define PUBLISH_COUNT 10

/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
static unsigned int countArray[PUBLISH_COUNT];
static unsigned int countArray[PUBLISH_COUNT];
static unsigned int rxMsgBufferTooBigCounter;
static unsigned int rxUnexpectedNumberCounter;
static unsigned int wrongYieldCount;

typedef enum
{
  CLOUD_DEMO_WIFI_INITIALIZATION_ERROR      = -2,
  CLOUD_DEMO_MAC_ADDRESS_ERROR              = -3,
  CLOUD_DEMO_WIFI_CONNECTION_ERROR          = -4,
  CLOUD_DEMO_IP_ADDRESS_ERROR               = -5,
  CLOUD_DEMO_AWS_CONNECTION_ERROR           = -6
} CLOUD_DEMO_Error_t;


/* Private function prototypes -----------------------------------------------*/
void CLOUD_Error_Handler(int errorCode);
void aws_credential(void);
void aws_iot_test_basic_disconnectCallbackHandler(AWS_IoT_Client *pClient, void *data);
int aws_iot_mqtt_tests_basic_connectivity(void);

/* Exported functions --------------------------------------------------------*/
/* Exported functions --------------------------------------------------------*/
/**
  * @brief  This function is executed in case of error occurrence.
  * @param  None
  * @retval None
  */
void CLOUD_Error_Handler(int errorCode)
{
  switch (errorCode)
  {
    case (CLOUD_DEMO_WIFI_INITIALIZATION_ERROR):
    {
      msg_info("Error initializing the module!\n");
      
      break;
    }
    case (CLOUD_DEMO_MAC_ADDRESS_ERROR):
    {
      msg_info("Error detecting module!\n");
      
      break;
    }
    case (CLOUD_DEMO_WIFI_CONNECTION_ERROR):
    {
      msg_info("Error connecting to AP!\n");
      
      break;
    }
    case (CLOUD_DEMO_IP_ADDRESS_ERROR):
    {
      msg_info("Error retrieving IP address!\n");
      
      break;
    }
    case (CLOUD_DEMO_AWS_CONNECTION_ERROR):
    {
      msg_info("Error connecting to Cloud!\n");
      
      break;
    }
    default:
    {
      break;
    }
  }
  
  while (1)
  {
    BSP_LED_Toggle(LED_GREEN);
    HAL_Delay(200);
  }
}

void aws_credential(void)
{
  char console_yn;
  do
  {
    msg_info("\rDo you want to update your AWS security credentials ? (y/n)  \b");
    console_yn= getchar();
  }
  while((console_yn != 'y') && (console_yn != 'n') && (console_yn != '\n'));
  if (console_yn != '\n') msg_info("\n");
  if (console_yn == 'y')
  {
    updateTLSKeys();
  }
  
    
  do
  {
    msg_info("\rDo you want to update server address and device name ? (y/n)  \b");
    console_yn = getchar();
  }
  while((console_yn != 'y') && (console_yn != 'n') && (console_yn != '\n'));
  if (console_yn != '\n') msg_info("\n");

  if (console_yn == 'y')
  {
    updateServerDeviceConfig();
  }
    
  msg_info("\n");
}


void aws_test(void const * par)
{
  uint8_t ipAddress[4];
  bool isTLSConfigured = false;
  bool isServerDeviceConfigured = false;
  const firmware_version_t  * fw_version;
  rfu_getVersion(&fw_version, false);
#ifdef HEAP_DEBUG
  stack_measure_prologue();
#endif

  msg_info("\n");
  msg_info("**************************************************************************\n");
  msg_info("***   STM32 IoT Discovery kit for STM32L475/STM32F413/STM32F769 MCU    ***\n");
  msg_info("***                  Cloud Connectivity Demonstration                  ***\n");
  msg_info("***              FW version %d.%d.%d - %s, %s              ***\n", 
      fw_version->major, fw_version->minor, fw_version->patch, fw_version->build_date, fw_version->build_time);
  msg_info("**************************************************************************\n");
    
  msg_info("\n*** Board personalisation ***\n\n");
  
  /* Possibility to update the parameters if the user button is pushed */
  msg_info("Press the User button (Blue) within the next 5 seconds if you want to change the configuration\n"
         "(NetWork and AWS security credentials)\n\n");
  
  if ( Button_WaitForPush(5000) ) 
  {
    network_credential();
    aws_credential();
  }
  

  if (network_init()!= 0)
  {
    CLOUD_Error_Handler(CLOUD_DEMO_IP_ADDRESS_ERROR);
  }

  /* Slight delay since the module seems to take some time prior to being able
   to retrieve its IP address after a connection. */
  HAL_Delay(500);

  msg_info("Retrieving the IP address.\n");

  if (network_get_ip_address((uint8_t*) ipAddress))
  {
    CLOUD_Error_Handler(CLOUD_DEMO_IP_ADDRESS_ERROR);
  }
  else
  {
    msg_info("IP address: %d.%d.%d.%d\n",
         ipAddress[0], ipAddress[1], ipAddress[2], ipAddress[3]);
  }
  /* End of WIFI initialisation */

  msg_info("Setting the RTC from the network time.\n");
  if (0 != setRTCTimeDateFromNetwork())
  {
    msg_error("Could not set the RTC from the network time.\n");
  }
  
 
  
  /* AWS configuration verification */ 
  if (checkTLSCredentials() == 0) {
    isTLSConfigured = true;
  }
  
  if (checkServerDevice() == 0) {
    isServerDeviceConfigured = true;
  }

  if (isTLSConfigured == false) {
    msg_info("Your AWS / TLS security credentials need to be entered to proceed\n");
  }
  while ( (isTLSConfigured == false) && (updateTLSKeys() >= 0) ) {
    if (checkTLSCredentials() == 0) {
      isTLSConfigured = true;
    }
  }
  
  if (isServerDeviceConfigured == false) {
    msg_info("Your server name and thing name need to be entered to proceed\n");
  }
  while ( (isServerDeviceConfigured == false) && (updateServerDeviceConfig() >= 0) )  {
    if (checkServerDevice() == 0) {
      isServerDeviceConfigured = true;
    }
  }

#if defined(RFU) && !defined(FIREWALL_MBEDLIB)
  updateFirmwareVersion();
#endif  /* RFU */
  
  /* end of AWS configuration verification */
  
   /* Start of AWS connectivity demonstration */
  msg_info("\n*** AWS connectivity demonstration ***\n\n");
  
  if ( 0 != subscribe_publish_sensor_values() )
  {
    CLOUD_Error_Handler(CLOUD_DEMO_AWS_CONNECTION_ERROR);
  }
  else
  {
    msg_info("AWS connectivity demonstration completed\n");
  }
  
#ifdef   HEAP_DEBUG  
  stack_measure_epilogue();
  uint32_t heap_max,heap_current,stack_size;
  
#ifdef   FIREWALL_MBEDLIB
  heap_firewall_stat(&heap_max,&heap_current,&stack_size);
  msg_info("FireWall Heap Max allocation 0x%x (%d), current allocation 0x%x (%d), Stack max size 0x%x (%d)\n",heap_max,heap_max,heap_current,heap_current,stack_size,stack_size);
#endif    

  heap_stat(&heap_max,&heap_current,&stack_size);  
  msg_info("Heap Max allocation 0x%x (%d), current allocation 0x%x (%d), Stack max size 0x%x (%d)\n",heap_max,heap_max,heap_current,heap_current,stack_size,stack_size);
#endif 

  /* Infinite loop */
  while (1)
  {
  }
}

void aws_iot_test_basic_disconnectCallbackHandler(AWS_IoT_Client *pClient, void *data)
{
  msg_warning("MQTT Disconnect");
  IoT_Error_t rc = FAILURE;

  if(NULL == pClient)
  {
    return;
  }

  IOT_UNUSED(data);

  if(aws_iot_is_autoreconnect_enabled(pClient)) 
  {
    msg_info("Auto Reconnect is enabled, Reconnecting attempt will start now\n");
  } 
  else 
  {
    msg_warning("Auto Reconnect not enabled. Starting manual reconnect...");
    rc = aws_iot_mqtt_attempt_reconnect(pClient);
    if(NETWORK_RECONNECTED == rc) 
    {
      msg_warning("Manual Reconnect Successful");
    } 
    else
    {
      msg_warning("Manual Reconnect Failed - %d", rc);
    }
  }
}
   
static void aws_iot_mqtt_tests_message_aggregator(AWS_IoT_Client *pClient, char *topicName,
							  uint16_t topicNameLen, IoT_Publish_Message_Params *params, void *pData) {
  char tempBuf[30];
  char *temp = NULL;
  unsigned int tempRow = 0, tempCol = 0;
  IoT_Error_t rc;

  IOT_UNUSED(tempRow);

  if(params->payloadLen <= 30) 
  {
    snprintf(tempBuf, params->payloadLen, params->payload);
    msg_info("Msg received : %s\n", tempBuf);
    temp = strtok(tempBuf, " ,:");
    temp = strtok(NULL, " ,:");
    if(NULL == temp) 
    {
      return;
    }
    tempRow = atoi(temp);
    temp = strtok(NULL, " ,:");
    temp = strtok(NULL, " ,:");
    tempCol = atoi(temp);
    if(NULL == temp) 
    {
      return;
    }
    if(tempCol > 0 && tempCol <= PUBLISH_COUNT) 
    {
      countArray[tempCol - 1]++;
    } 
    else 
    {
      msg_warning("\n Thread : %d, Msg : %d ", tempRow, tempCol);
      rxUnexpectedNumberCounter++;
    }
    rc = aws_iot_mqtt_yield(pClient, 10);
    if(MQTT_CLIENT_NOT_IDLE_ERROR != rc) 
    {
      msg_error("\n Yield succeeded in callback!!! Client state : %d Rc : %d\n",
      aws_iot_mqtt_get_client_state(pClient), rc);
      wrongYieldCount++;
    }
  } 
  else 
  {
    rxMsgBufferTooBigCounter++;
  }
}

int aws_iot_mqtt_tests_basic_connectivity(void)
{
  const char *serverAddress = NULL;
  const char *pCaCert;
  const char *pClientCert;
  const char *pClientPrivateKey;
  const char *pDeviceName = NULL;

  char cPayload[100];
        
  IoT_Publish_Message_Params params = { QOS0, 0, 0, 0, NULL, 0 };

  int32_t i = 0, threadId=1;

  IoT_Error_t rc = FAILURE;

  AWS_IoT_Client client = {0};
  IoT_Client_Init_Params mqttInitParams = iotClientInitParamsDefault;
  IoT_Client_Connect_Params connectParams = iotClientConnectParamsDefault;

  msg_info("AWS IoT SDK Version %d.%d.%d-%s\n", VERSION_MAJOR, VERSION_MINOR, VERSION_PATCH, VERSION_TAG);

  getServerAddress(&serverAddress);
  getDeviceName(&pDeviceName);
  getTLSKeys(&pCaCert, &pClientCert, &pClientPrivateKey);
  mqttInitParams.enableAutoReconnect = false;
  mqttInitParams.pHostURL = (char *) serverAddress;
  mqttInitParams.port = AWS_IOT_MQTT_PORT;
  mqttInitParams.pRootCALocation = (char *) pCaCert;
  mqttInitParams.pDeviceCertLocation = (char *) pClientCert;
  mqttInitParams.pDevicePrivateKeyLocation = (char *) pClientPrivateKey;
  mqttInitParams.mqttCommandTimeout_ms = 20000;
  mqttInitParams.tlsHandshakeTimeout_ms = 5000;
  mqttInitParams.isSSLHostnameVerify = true;
  mqttInitParams.disconnectHandler = aws_iot_test_basic_disconnectCallbackHandler;
  mqttInitParams.disconnectHandlerData = NULL;

  rc = aws_iot_mqtt_init(&client, &mqttInitParams);
  if(AWS_SUCCESS != rc) 
  {
    msg_error("aws_iot_mqtt_init returned error : %d\n", rc);
    return rc;
  }

  connectParams.keepAliveIntervalInSec = 30;
  connectParams.isCleanSession = true;
  connectParams.MQTTVersion = MQTT_3_1_1;
  connectParams.pClientID = (char *) pDeviceName;
  connectParams.clientIDLen = (uint16_t) strlen(pDeviceName);
  connectParams.isWillMsgPresent = false;

  msg_info("MQTT connection in progress...\n");
  rc = aws_iot_mqtt_connect(&client, &connectParams);
  if(AWS_SUCCESS != rc) 
  {
    msg_error("Error(%d) connecting to %s:%d\n", rc, mqttInitParams.pHostURL, mqttInitParams.port);
    return rc;
  } 
  else
  {
    msg_info("Connected to %s:%d\n", mqttInitParams.pHostURL, mqttInitParams.port);
  }
        
  /*
  * Enable Auto Reconnect functionality. Minimum and Maximum time of Exponential backoff are set in aws_iot_config.h
  *  #AWS_IOT_MQTT_MIN_RECONNECT_WAIT_INTERVAL
  *  #AWS_IOT_MQTT_MAX_RECONNECT_WAIT_INTERVAL
  rc = aws_iot_mqtt_autoreconnect_set_status(&client, true);
  if(SUCCESS != rc) {
    msg_error("Unable to set Auto Reconnect to true - %d\n", rc);
    return rc;
  }
  */
        
  rc = aws_iot_mqtt_subscribe(&client, INTEGRATION_TEST_TOPIC, strlen(INTEGRATION_TEST_TOPIC), QOS1,
								aws_iot_mqtt_tests_message_aggregator, NULL);
  if(rc != AWS_SUCCESS) 
  {
    msg_error("Error Subscribing --> returned #%d\n", rc);
    if (aws_iot_mqtt_is_client_connected(&client)) 
    {
      aws_iot_mqtt_disconnect(&client);                 
    }
    return rc;
  }
                
                
  for(i = 0; i < PUBLISH_COUNT; i++) 
  {
    snprintf(cPayload, 100, "Thread : %ld, Msg : %ld", threadId, i + 1);
    msg_info("Msg being published: %s\n", cPayload);
    params.payload = (void *) cPayload;
    params.payloadLen = strlen(cPayload) + 1;
    params.qos = QOS1;
    params.isRetained = 0;
    rc = aws_iot_mqtt_publish(&client, INTEGRATION_TEST_TOPIC, strlen(INTEGRATION_TEST_TOPIC), &params);

    if(rc != AWS_SUCCESS) 
    {
      msg_error("Error Publishing #%ld --> %d\n", i, rc);
      if (aws_iot_mqtt_is_client_connected(&client)) 
      {
        aws_iot_mqtt_disconnect(&client);                 
      }
      return rc;
    }
  }
         
  /* This delay is to ensure that the last publish message has enough time to be received */
  HAL_Delay(1000);
      
  rc = aws_iot_mqtt_yield(&client, 1000);
  if(rc != AWS_SUCCESS) 
  {
    msg_error("Error Yield Returned : %d\n", rc);
    if (aws_iot_mqtt_is_client_connected(&client)) 
    {
      aws_iot_mqtt_disconnect(&client);                 
    }
    return rc;
  }
        
  rc = aws_iot_mqtt_disconnect(&client);
  if(rc != AWS_SUCCESS) 
  {
    msg_error("Error Disconnect Returned : %d\n", rc);
    return rc;
  }
        
   return rc;
}

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
