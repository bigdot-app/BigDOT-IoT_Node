/**
  ******************************************************************************
  * @file    aws_iot_test_metering.c
  * @author  MCD Application Team
  * @version V1.0.0
  * @date    28-March-2017
  * @brief   Amazon AWS Cloud connection setup and metering test
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
#include <string.h>
#include "aws_iot_config.h"
#include "aws_iot_log.h"
#include "aws_iot_version.h"
#include "aws_iot_mqtt_client_interface.h"

#include "tls_params.h"
#include "iot_flash_config.h"
#include "msg.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/

void disconnectCallbackHandler(AWS_IoT_Client *pClient, void *data);
int test_aws_meter_publish(AWS_IoT_Client* pClient);

/**
 * @brief Default MQTT port is pulled from the aws_iot_config.h
 */
uint32_t port = AWS_IOT_MQTT_PORT;

/**
 * @brief This parameter will avoid infinite loop of publish and exit the program after certain number of publishes
 */
uint32_t publishCount = 0;

/* Private function prototypes -----------------------------------------------*/

/* Exported functions --------------------------------------------------------*/
extern int aws_iot_test_metering(void);

/*
void iot_subscribe_callback_handler(AWS_IoT_Client *pClient, char *topicName, uint16_t topicNameLen,
									IoT_Publish_Message_Params *params, void *pData)
{
  IOT_UNUSED(pData);
  IOT_UNUSED(pClient);
  msg_info("Subscribe callback\n");
  msg_info("%.*s\t%.*s\n", topicNameLen, topicName, (int) params->payloadLen, params->payload);
}
*/
void disconnectCallbackHandler(AWS_IoT_Client *pClient, void *data) 
{
  msg_warning("MQTT Disconnect");
  IoT_Error_t rc = FAILURE;

  if(NULL == pClient) {
    return;
  }

  IOT_UNUSED(data);

  if(aws_iot_is_autoreconnect_enabled(pClient)) {
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

/*=======================     METERING     ====================================*/

#include "metering.h"

#define MQTT_DEV_NAME "gpiot"
#define MQTT_INDEV_TOPIC  "/inbox/gpiot/deviceInfo"
#define MQTT_OUTDEV_TOPIC  "/outbox/gpiot/deviceInfo"

int stiot_metering_publish(void * mqtt_ctxt, const char * topic, const char * msg);
/* static stiot_metering_context_t * l_meter_ctxt; */

/* MQTT publish API abstraction called by the metering loop. */
int stiot_metering_publish(void * mqtt_ctxt, const char * topic, const char * msg) 
{
  int rc;
  /*
  MQTTMessage mqmsg;
  memset(&mqmsg, 0, sizeof(MQTTMessage));
  mqmsg.qos = QOS1;
  mqmsg.payload = (char *) msg;
  mqmsg.payloadlen = strlen(msg);
  
  rc = MQTTPublish(mqtt_ctxt, topic, &mqmsg);
  if (rc == 0)
  {
    msg_info("Published %s on %s\n", (char *)(mqmsg.payload), topic);
  }
  */
  
  IoT_Publish_Message_Params params;
  
  memset(&params, 0, sizeof(params));
  params.qos = QOS1;
  params.payload = (void*)msg;
  params.payloadLen = strlen(msg);
  
  
  rc = aws_iot_mqtt_publish(mqtt_ctxt, topic, strlen(topic), &params);
  if (rc == 0)
  {
    msg_info("Published %s on %s\n", (char *)msg, topic);
  } else {
    msg_info("stiot_metering_publish(): aws_iot_mqtt_publish() returns %d\n", rc);
  }
  return rc;
}

static void test_mqtt_meter_messageArrived(AWS_IoT_Client *pClient, char *topicName, uint16_t topicNameLen,
									IoT_Publish_Message_Params *params, void *pData) {
  IOT_UNUSED(pData);
  IOT_UNUSED(pClient);
  msg_info("Subscribe callback ");
  msg_info("%.*s\t%.*s\n", topicNameLen, topicName, (int) params->payloadLen, (char *)params->payload);
        
  /* 
  msg_info("%.*s\t", md->topicName->lenstring.len, md->topicName->lenstring.data);
  msg_info("%.*s\n", md->message->payloadlen, (char*)md->message->payload);
    
  if (memcmp(md->topicName->lenstring.data, "inbox/"MQTT_DEV_NAME"/deviceInfo", md->topicName->lenstring.len) == 0)
  { // Crouton: the device should send the deviceInfo back.
    (void) stiot_metering_need_deviceInfoPublish(l_meter_ctxt);
  }
    
  if (memcmp(md->topicName->lenstring.data, "/inbox/gpiot/magnetomute", md->topicName->lenstring.len) == 0)
  {
    cJSON * root = cJSON_Parse(md->message->payload);
    int lock = cJSON_GetObjectItem(root, "value")->valueint;
    stiot_metering_reporting_freq_t rep = (lock == 1) ? STIOT_METERING_REPORTING_FREQ_NONE : STIOT_METERING_REPORTING_FREQ_LOW;
    stiot_metering_sensor_setReportingFreq(stiot_metering_sensor_get(l_meter_ctxt, STIOT_SENSOR_HYGROMETER_ID), rep);
    cJSON_Delete(root);
    char msg[20];
    snmsg_info(msg, 100, "{ \"value\": %s }", (lock == 1) ? "true" : "false");  // Return the EndPoint status to crouton
    stiot_metering_publish(&MqClient, "/outbox/gpiot/magnetomute", msg);
  }
  */
 }


/*
 * @brief  test mqtt: report the values of all the activated metering probes
 *         through MQTT messages.
 * @param  None
 * @retval int
 */
   
int test_aws_meter_publish(AWS_IoT_Client* pClient)
{
  int rc = -1;
  int count = 0;

  rc = aws_iot_mqtt_subscribe(pClient, MQTT_INDEV_TOPIC, sizeof(MQTT_INDEV_TOPIC), QOS0, test_mqtt_meter_messageArrived, NULL);
  if(rc != SUCCESS) {
    msg_error("Error Subscribing to topic %s --> returned #%d\n", MQTT_INDEV_TOPIC, rc);
    if (aws_iot_mqtt_is_client_connected(pClient)) {
      aws_iot_mqtt_disconnect(pClient);                 
    }
    return rc;
  } else {
    msg_info("Subscribed to topic %s\n", MQTT_INDEV_TOPIC);
  }

  rc = aws_iot_mqtt_subscribe(pClient, "/inbox/gpiot/magnetomute", sizeof("/inbox/gpiot/magnetomute"), QOS0, test_mqtt_meter_messageArrived, NULL);
  if(rc != SUCCESS) {
    msg_error("Error Subscribing to topic %s --> returned #%d\n", "/inbox/gpiot/magnetomute", rc);
    if (aws_iot_mqtt_is_client_connected(pClient)) {
      aws_iot_mqtt_disconnect(pClient);                 
    }
    return rc;
  }  else {
    msg_info("Subscribed to topic %s\n", "/inbox/gpiot/magnetomute");
  }

  rc = aws_iot_mqtt_subscribe(pClient, "/inbox/gpiot/hygrothreshold", sizeof("/inbox/gpiot/hygrothreshold"), QOS0, test_mqtt_meter_messageArrived, NULL);
  if(rc != SUCCESS) {
    msg_error("Error Subscribing to topic %s --> returned #%d\n", "/inbox/gpiot/hygrothreshold", rc);
    if (aws_iot_mqtt_is_client_connected(pClient)) {
      aws_iot_mqtt_disconnect(pClient);                 
    }
    return rc;
  }  else {
    msg_info("Subscribed to topic %s\n", "/inbox/gpiot/hygrothreshold");
  }

  stiot_metering_context_t * meter_ctxt = stiot_metering_init((void*)pClient);
  /* l_meter_ctxt = meter_ctxt; */
      
  /* rc = stiot_metering_sensor_setReportingFreq(stiot_metering_sensor_get(meter_ctxt, STIOT_SENSOR_HYGROMETER_ID),
                                                STIOT_METERING_REPORTING_FREQ_LOW); */
  rc = stiot_metering_sensor_setReportingFreq(stiot_metering_sensor_get(meter_ctxt, STIOT_SENSOR_THERMOMETER1_ID),
                                                STIOT_METERING_REPORTING_FREQ_LOW);
  /* rc = stiot_metering_sensor_setReportingFreq(stiot_metering_sensor_get(meter_ctxt, STIOT_SENSOR_MAGNETOMETER_ID),
                                                STIOT_METERING_REPORTING_FREQ_LOW); */
  for (count = 0; count < 10; count++) {
    aws_iot_mqtt_yield(pClient, 500);
    rc = stiot_metering_report((void*)pClient, meter_ctxt);
    if (rc != 0) {
      msg_error("Metering loop failed!\n");
    }
  }

  return rc;
}


int aws_iot_test_metering(void)
{
  /* bool infinitePublishFlag = true; */
  const char *serverAddress = NULL;
  const char *pCaCert;
  const char *pClientPublicCert;
  const char *pClientPrivateCert;
  const char *pDeviceName = NULL;
  /* char cPayload[100]; */
  int res;

  IoT_Error_t rc = FAILURE;

  AWS_IoT_Client client = {0};
  IoT_Client_Init_Params mqttInitParams = iotClientInitParamsDefault;
  IoT_Client_Connect_Params connectParams = iotClientConnectParamsDefault;

  /*
  IoT_Publish_Message_Params paramsQOS0;
  IoT_Publish_Message_Params paramsQOS1;
  */
  
  msg_info("AWS IoT SDK Version %d.%d.%d-%s\n", VERSION_MAJOR, VERSION_MINOR, VERSION_PATCH, VERSION_TAG);

  if ((getServerAddress(&serverAddress) != 0) || (strlen(serverAddress)==0) ) 
  {
    msg_error("aws_iot_mqtt_init: Server adress not defined\n");
    return -1;
  }
  
  if ((getDeviceName(&pDeviceName) != 0) || (strlen(pDeviceName)==0) ) 
  {
    msg_error("aws_iot_mqtt_init: Device name not defined\n");
    return -1;
  }
  
  if ( (getTLSKeys(&pCaCert, &pClientPublicCert, &pClientPrivateCert) != 0) ||
    ( strlen(pCaCert)==0 ) || ( strlen(pClientPublicCert)==0 ) || ( strlen(pClientPrivateCert)==0 ))
  {
    msg_error("aws_iot_mqtt_init: Certificats or Key not defined\n");
    return -1;
  }
  
  mqttInitParams.enableAutoReconnect = false; /* We enable this later below */
  mqttInitParams.pHostURL = (char *) serverAddress;
  mqttInitParams.port = port;
  mqttInitParams.pRootCALocation = (char *) pCaCert;
  mqttInitParams.pDeviceCertLocation = (char *) pClientPublicCert;
  mqttInitParams.pDevicePrivateKeyLocation = (char *) pClientPrivateCert;
  mqttInitParams.mqttCommandTimeout_ms = 20000;
  mqttInitParams.tlsHandshakeTimeout_ms = 5000;
  mqttInitParams.isSSLHostnameVerify = true;
  mqttInitParams.disconnectHandler = disconnectCallbackHandler;
  mqttInitParams.disconnectHandlerData = NULL;

  rc = aws_iot_mqtt_init(&client, &mqttInitParams);
  if(SUCCESS != rc) {
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
  if(SUCCESS != rc) {
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
  */
  rc = aws_iot_mqtt_autoreconnect_set_status(&client, true);
  if(SUCCESS != rc) {
    msg_error("Unable to set Auto Reconnect to true - %d\n", rc);
    if (aws_iot_mqtt_is_client_connected(&client)) 
    {
      aws_iot_mqtt_disconnect(&client);
    }
    return rc;
  }
  
  res = test_aws_meter_publish(&client);
  if(0 != res) {
    msg_error("Error reporting the probe values - %d\n", rc);
    if (aws_iot_mqtt_is_client_connected(&client)) 
    {
      aws_iot_mqtt_disconnect(&client);
    }
    return rc;
  }
  
        
/*	msg_info("Subscribing...\n");
	rc = aws_iot_mqtt_subscribe(&client, "sdkTest/sub", 11, QOS0, iot_subscribe_callback_handler, NULL);
	if(SUCCESS != rc) {
		msg_error("Error subscribing : %d\n", rc);
		return rc;
	}

	sprintf(cPayload, "%s : %d ", "hello from SDK", i);

	paramsQOS0.qos = QOS0;
	paramsQOS0.payload = (void *) cPayload;
	paramsQOS0.isRetained = 0;

	paramsQOS1.qos = QOS1;
	paramsQOS1.payload = (void *) cPayload;
	paramsQOS1.isRetained = 0;

	if(publishCount != 0) {
		infinitePublishFlag = false;
	}

	while((NETWORK_ATTEMPTING_RECONNECT == rc || NETWORK_RECONNECTED == rc || SUCCESS == rc)
		  && (publishCount > 0 || infinitePublishFlag)) {

		//Max time the yield function will wait for read messages
		rc = aws_iot_mqtt_yield(&client, 100);
		if(NETWORK_ATTEMPTING_RECONNECT == rc) {
			// If the client is attempting to reconnect we will skip the rest of the loop.
			continue;
		}

		msg_info("-->sleep\n");
    HAL_Delay(15000);
		sprintf(cPayload, "%s : %d ", "hello from SDK QOS0", i++);
		paramsQOS0.payloadLen = strlen(cPayload);
		rc = aws_iot_mqtt_publish(&client, "sdkTest/sub", 11, &paramsQOS0);
		if(publishCount > 0) {
			publishCount--;
		}

		sprintf(cPayload, "%s : %d ", "hello from SDK QOS1", i++);
		paramsQOS1.payloadLen = strlen(cPayload);
		rc = aws_iot_mqtt_publish(&client, "sdkTest/sub", 11, &paramsQOS1);
		if (rc == MQTT_REQUEST_TIMEOUT_ERROR) {
			msg_warning("QOS1 publish ack not received.\n");
			rc = SUCCESS;
		}
		if(publishCount > 0) {
			publishCount--;
		}
	}

	if(SUCCESS != rc) {
		msg_error("An error occurred in the loop.\n");
	} else {
		msg_info("Publish done\n");
	}
       
*/

  rc = aws_iot_mqtt_disconnect(&client);

  return rc;
}

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
