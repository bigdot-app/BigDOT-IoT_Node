################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/src/aws_iot_mqtt_client.c \
C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/src/aws_iot_mqtt_client_common_internal.c \
C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/src/aws_iot_mqtt_client_connect.c \
C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/src/aws_iot_mqtt_client_publish.c \
C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/src/aws_iot_mqtt_client_subscribe.c \
C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/src/aws_iot_mqtt_client_unsubscribe.c \
C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/src/aws_iot_mqtt_client_yield.c 

OBJS += \
./Middlewares/Third_Party/AWS/aws_iot_mqtt_client.o \
./Middlewares/Third_Party/AWS/aws_iot_mqtt_client_common_internal.o \
./Middlewares/Third_Party/AWS/aws_iot_mqtt_client_connect.o \
./Middlewares/Third_Party/AWS/aws_iot_mqtt_client_publish.o \
./Middlewares/Third_Party/AWS/aws_iot_mqtt_client_subscribe.o \
./Middlewares/Third_Party/AWS/aws_iot_mqtt_client_unsubscribe.o \
./Middlewares/Third_Party/AWS/aws_iot_mqtt_client_yield.o 

C_DEPS += \
./Middlewares/Third_Party/AWS/aws_iot_mqtt_client.d \
./Middlewares/Third_Party/AWS/aws_iot_mqtt_client_common_internal.d \
./Middlewares/Third_Party/AWS/aws_iot_mqtt_client_connect.d \
./Middlewares/Third_Party/AWS/aws_iot_mqtt_client_publish.d \
./Middlewares/Third_Party/AWS/aws_iot_mqtt_client_subscribe.d \
./Middlewares/Third_Party/AWS/aws_iot_mqtt_client_unsubscribe.d \
./Middlewares/Third_Party/AWS/aws_iot_mqtt_client_yield.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Third_Party/AWS/aws_iot_mqtt_client.o: C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/src/aws_iot_mqtt_client.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/Third_Party/AWS/aws_iot_mqtt_client_common_internal.o: C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/src/aws_iot_mqtt_client_common_internal.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/Third_Party/AWS/aws_iot_mqtt_client_connect.o: C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/src/aws_iot_mqtt_client_connect.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/Third_Party/AWS/aws_iot_mqtt_client_publish.o: C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/src/aws_iot_mqtt_client_publish.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/Third_Party/AWS/aws_iot_mqtt_client_subscribe.o: C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/src/aws_iot_mqtt_client_subscribe.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/Third_Party/AWS/aws_iot_mqtt_client_unsubscribe.o: C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/src/aws_iot_mqtt_client_unsubscribe.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/Third_Party/AWS/aws_iot_mqtt_client_yield.o: C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/src/aws_iot_mqtt_client_yield.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


