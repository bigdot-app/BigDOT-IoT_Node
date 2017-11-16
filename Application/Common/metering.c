/**
  ******************************************************************************
  * @file    metering.c
  * @author  MCD Application Team
  * @version V1.0.0
  * @date    28-March-2017
  * @brief   Control of the measurement sampling and MQTT reporting loop.
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
#include <stdio.h>
#include "main.h"
#include "metering.h"


/* Private defines ------------------------------------------------------------*/

#define STIOT_METERING_SENSOR_INIT(pCtx, pSensor) \
  memcpy((pCtx)->aSensors[pSensor##_ID].sensor_name, pSensor##_NAME, MIN(strlen(pSensor##_NAME)+1, STIOT_SENSOR_NAME_MAX_LENGTH)); \
  (pCtx)->aSensors[pSensor##_ID].sample_size = pSensor##_VECT_SIZE;
#define STIOT_METERING_SENSOR_HND(pCtx, pSensor) \
  ((pCtx)->aSensors[pSensor##_ID].sensor_hnd)
  
  
#define MIN(a,b)  (((a) < (b)) ? (a) : (b))

/** The implementation needs the typedef (may redirect to any MQTT client), not the caller.
 *  Keep it opaque.
 */

/* Private variables ---------------------------------------------------------*/
static stiot_metering_context_t l_metering_context;

static const char devinfo_msg[] = "{\
\"deviceInfo\": {\
  \"name\": \"gpiot\",\
  \"endPoints\": {\
    \"thermo1\": {\
      \"values\": {\
        \"labels\": [],\
        \"series\": [[40]],\
        \"update\": null\
      },\
      \"max\": 20,\
      \"low\": 5,\
      \"high\": 60,\
      \"card-type\": \"crouton-chart-line\", \
      \"title\": \"Temp. (C)\"\
    },\
    \"hygro\": {\
      \"values\": {\
        \"labels\": [],\
        \"series\": [76]\
      },\
      \"total\": 100,\
      \"centerSum\": false,\
      \"units\": \"% RH\",\
      \"card-type\": \"crouton-chart-donut\"\
    },\
    \"proximity\": {\
      \"units\": \"mm\",\
      \"values\": {\
        \"value\": 0\
      },\
      \"card-type\": \"crouton-simple-text\",\
      \"title\": \"Proximity\"\
    },\
    \"baro\": {\
      \"units\": \"hPa\",\
      \"values\": {\
        \"value\": 0\
      },\
      \"card-type\": \"crouton-simple-text\"\
    },\
    \"magnetomute\": {\
      \"values\": {\
        \"value\": false\
      },\
      \"labels\": {\
        \"true\": \"Mute\",\
        \"false\": \"Unmute\"\
      },\
      \"card-type\": \"crouton-simple-toggle\"\
    },\
    \"hygrothreshold\": {\
      \"values\": {\
        \"value\": 30\
      },\
      \"min\": 0,\
      \"max\": 100,\
      \"card-type\": \"crouton-simple-slider\",\
      \"title\": \"Hygro threshold\"\
    }\
  },\
  \"description\": \"GPs IOT dev\",\
  \"status\": \"good\"\
}\
}";
    
/* Private function prototypes -----------------------------------------------*/
extern int stiot_metering_publish(void * mqtt_ctxt, char * topic, char * msg);


int stiot_metering_sensor_setReportingFreq(stiot_metering_sensor_t * sensor, stiot_metering_reporting_freq_t freq)
{
  int rc = 0;
  if (sensor != NULL) 
  {
    sensor->reporting_freq = freq;
  }
  else
  {
    rc = -1;
  }
  return rc;
}

int stiot_metering_sensor_setThreshold(stiot_metering_sensor_t * sensor, int threshold)
{
  int rc = 0;
  if (sensor != NULL) 
  {
    sensor->threshold = threshold;
  }
  else
  {
    rc = -1;
  }
  return rc;
}
/**
  * @brief  Set the MQTT name and the vector multiplicity of the selected sensors.
  * @param  mqtt_ctx
  * @retval stiot_metering_context_t
  */
stiot_metering_context_t * stiot_metering_init(stiot_mqtt_context_t * mqtt_ctx)
{
  int rc = 0;
  stiot_metering_context_t * ctx = &l_metering_context;
  
  memset(ctx, 0, sizeof(stiot_metering_context_t));
  ctx->deviceInfoNeedsPublish = true;

  BSP_HSENSOR_Init();
    
  BSP_TSENSOR_Init();
  
  BSP_PSENSOR_Init();
  
  BSP_MAGNETO_Init();
 
  BSP_GYRO_Init();

  BSP_ACCELERO_Init();
  
  VL53L0X_PROXIMITY_Init();
  
  /* Note: the endpoints names must match the sensor name. */

  if (rc == 0)
  {
    return ctx;
  }
  else
  {
    return NULL;
  }
}

int stiot_metering_need_deviceInfoPublish(stiot_metering_context_t * meter_ctx)
{
  if (meter_ctx != NULL)
  {
    meter_ctx->deviceInfoNeedsPublish = true;
    return 0;
  }
  return -1;
}

stiot_metering_sensor_t * stiot_metering_sensor_get(stiot_metering_context_t * meter_ctx, stiot_metering_sensorID_t ID)
{
  if (meter_ctx != NULL)
  {
    return &(meter_ctx->aSensors[ID]);
  }
  else
  {
    return 0;
  }
}

int stiot_metering_report(stiot_mqtt_context_t * mqtt_ctx, stiot_metering_context_t * meter_ctx)
{
  char msg[STIOT_METERING_MSG_MAX_SIZE];
  char topic[STIOT_METERING_TOPIC_MAX_SIZE];
  int rc = 0;
  
  if (meter_ctx->deviceInfoNeedsPublish == true)
  { // use MQTT_OUTDEV_TOPIC !
    rc = stiot_metering_publish(mqtt_ctx, "/outbox/gpiot/deviceInfo", (char *)devinfo_msg);
    if (rc == 0)
    {
      meter_ctx->deviceInfoNeedsPublish = false;
    }
    else
    {
      printf("Error: failed to publish deviceInfo; size: %d\n", sizeof(devinfo_msg));
    }
  }
  
  for (int i = 0 ; i < STIOT_SENSOR_MAX_ID; i++)
  {
    msg[0] = '\0';
    if (meter_ctx->aSensors[i].reporting_freq == STIOT_METERING_REPORTING_FREQ_LOW)
    { /* Measure, sample and publish. */
      switch(i)
      {
        case STIOT_SENSOR_HYGROMETER_ID:
        {
          float hum_value = 0.0;
          hum_value = BSP_HSENSOR_ReadHumidity();
          snprintf(topic, STIOT_METERING_TOPIC_MAX_SIZE, "%s/%s", STIOT_METERING_SENSOR_TOPIC, STIOT_SENSOR_HYGROMETER_NAME);
          snprintf(msg, STIOT_METERING_MSG_MAX_SIZE, "{ \"labels\": [], \"series\": [%.1f] }", hum_value); // donut
          //snprintf(msg, STIOT_METERING_MSG_MAX_SIZE, "{ \"values\": { \"labels\": null, \"series\": null, \"update\": { \"labels\" : [1], \"series\": [[%.1f]] }}}", hum_value); // chart
          
          GPIO_InitTypeDef GPIO_InitStruct;
          GPIO_InitStruct.Pin = LED2_Pin;
          GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
          GPIO_InitStruct.Pull = GPIO_NOPULL;
          GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
          HAL_GPIO_Init(LED2_GPIO_Port, &GPIO_InitStruct);
          HAL_GPIO_WritePin(LED2_GPIO_Port, LED2_Pin, (hum_value >= meter_ctx->aSensors[i].threshold) ? GPIO_PIN_SET : GPIO_PIN_RESET);
          break;
        }
        case STIOT_SENSOR_THERMOMETER1_ID:
        {
          float temp_value = 0.0;
          temp_value = BSP_TSENSOR_ReadTemp();
          snprintf(topic, STIOT_METERING_TOPIC_MAX_SIZE, "%s/%s", STIOT_METERING_SENSOR_TOPIC, STIOT_SENSOR_THERMOMETER1_NAME);
          //snprintf(msg, STIOT_METERING_MSG_MAX_SIZE, "{ \"value\": %.1d }", temp_value);
          snprintf(msg, STIOT_METERING_MSG_MAX_SIZE, "{ \"update\": { \"labels\": [], \"series\": [[%.1f]] } }", temp_value);
          break;
        }
        case STIOT_SENSOR_THERMOMETER2_ID:
          break;
        case STIOT_SENSOR_BAROMETER_ID:
        {
          float baro_value = 0;
          baro_value = BSP_PSENSOR_ReadPressure();
          snprintf(topic, STIOT_METERING_TOPIC_MAX_SIZE, "%s/%s", STIOT_METERING_SENSOR_TOPIC, STIOT_SENSOR_BAROMETER_NAME);
          snprintf(msg, STIOT_METERING_MSG_MAX_SIZE, "{ \"value\": %f }", baro_value); // text
          break;
        }
        case STIOT_SENSOR_MAGNETOMETER_ID:
        {
          int16_t axes_values[3];
          BSP_MAGNETO_GetXYZ(axes_values);
          snprintf(topic, STIOT_METERING_TOPIC_MAX_SIZE, "%s/%s", STIOT_METERING_SENSOR_TOPIC, STIOT_SENSOR_MAGNETOMETER_NAME);
          snprintf(msg, STIOT_METERING_MSG_MAX_SIZE, "{ \"x\": %d, \"y\": %d, \"z\": %d }", axes_values[0], axes_values[1], axes_values[2]);
          break;
        }
        case STIOT_SENSOR_GYROMETER_ID:
        {
          float axes_values[3];
          BSP_GYRO_GetXYZ(axes_values);
          snprintf(topic, STIOT_METERING_TOPIC_MAX_SIZE, "%s/%s", STIOT_METERING_SENSOR_TOPIC, STIOT_SENSOR_GYROMETER_NAME);
          snprintf(msg, STIOT_METERING_MSG_MAX_SIZE, "{ \"x\": %f, \"y\": %f, \"z\": %f }", axes_values[0], axes_values[1], axes_values[2]);
          break;
        }
        case STIOT_SENSOR_ACCELEROMETER_ID:
        {
          int16_t axes_values[3];
          BSP_ACCELERO_AccGetXYZ(axes_values);
          snprintf(topic, STIOT_METERING_TOPIC_MAX_SIZE, "%s/%s", STIOT_METERING_SENSOR_TOPIC, STIOT_SENSOR_ACCELEROMETER_NAME);
          snprintf(msg, STIOT_METERING_MSG_MAX_SIZE, "{ \"x\": %d, \"y\": %d, \"z\": %d }", axes_values[0], axes_values[1], axes_values[2]);
          break;
        }
        case STIOT_SENSOR_PROXIMITY_ID:
        {
          uint16_t proximity_value = 0;
          proximity_value = VL53L0X_PROXIMITY_GetDistance();
          snprintf(topic, STIOT_METERING_TOPIC_MAX_SIZE, "%s/%s", STIOT_METERING_SENSOR_TOPIC, STIOT_SENSOR_PROXIMITY_NAME);
          snprintf(msg, STIOT_METERING_MSG_MAX_SIZE, "{ \"value\": %d }", proximity_value); // text
          break;
        }
        case STIOT_SENSOR_SOUNDMETER_ID:
          break;
        case STIOT_SENSOR_MAX_ID:
          break;
        default:
          break;
      }
      if (msg[0] != '\0')
      {
          rc = stiot_metering_publish(mqtt_ctx, topic, msg);
      }
       
    }
  }
  return rc; 
}
    

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
