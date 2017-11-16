################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/aws_iot_test_basic_connectivity.c \
C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/aws_iot_test_metering.c \
C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/entropy_hardware_poll.c \
C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/firewall_wrapper.c \
C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/heap.c \
C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/iot_flash_config.c \
C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/mbedtls_patch.c \
C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/metering.c \
C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/network.c \
C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/network_st_wrapper.c \
C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/rfu.c \
C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/sensors_data.c \
C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/subscribe_publish_sensor_values.c \
C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/timedate.c \
C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/timer.c 

OBJS += \
./Application/Common/aws_iot_test_basic_connectivity.o \
./Application/Common/aws_iot_test_metering.o \
./Application/Common/entropy_hardware_poll.o \
./Application/Common/firewall_wrapper.o \
./Application/Common/heap.o \
./Application/Common/iot_flash_config.o \
./Application/Common/mbedtls_patch.o \
./Application/Common/metering.o \
./Application/Common/network.o \
./Application/Common/network_st_wrapper.o \
./Application/Common/rfu.o \
./Application/Common/sensors_data.o \
./Application/Common/subscribe_publish_sensor_values.o \
./Application/Common/timedate.o \
./Application/Common/timer.o 

C_DEPS += \
./Application/Common/aws_iot_test_basic_connectivity.d \
./Application/Common/aws_iot_test_metering.d \
./Application/Common/entropy_hardware_poll.d \
./Application/Common/firewall_wrapper.d \
./Application/Common/heap.d \
./Application/Common/iot_flash_config.d \
./Application/Common/mbedtls_patch.d \
./Application/Common/metering.d \
./Application/Common/network.d \
./Application/Common/network_st_wrapper.d \
./Application/Common/rfu.d \
./Application/Common/sensors_data.d \
./Application/Common/subscribe_publish_sensor_values.d \
./Application/Common/timedate.d \
./Application/Common/timer.d 


# Each subdirectory must supply rules for building sources it contributes
Application/Common/aws_iot_test_basic_connectivity.o: C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/aws_iot_test_basic_connectivity.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/Common/aws_iot_test_metering.o: C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/aws_iot_test_metering.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/Common/entropy_hardware_poll.o: C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/entropy_hardware_poll.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/Common/firewall_wrapper.o: C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/firewall_wrapper.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/Common/heap.o: C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/heap.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/Common/iot_flash_config.o: C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/iot_flash_config.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/Common/mbedtls_patch.o: C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/mbedtls_patch.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/Common/metering.o: C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/metering.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/Common/network.o: C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/network.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/Common/network_st_wrapper.o: C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/network_st_wrapper.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/Common/rfu.o: C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/rfu.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/Common/sensors_data.o: C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/sensors_data.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/Common/subscribe_publish_sensor_values.o: C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/subscribe_publish_sensor_values.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/Common/timedate.o: C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/timedate.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/Common/timer.o: C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Src/timer.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


