################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x/vl53l0x_api.c \
C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x/vl53l0x_api_calibration.c \
C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x/vl53l0x_api_core.c \
C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x/vl53l0x_api_ranging.c \
C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x/vl53l0x_api_strings.c \
C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x/vl53l0x_platform_log.c 

OBJS += \
./Drivers/BSP/Components/vl53l0x/vl53l0x_api.o \
./Drivers/BSP/Components/vl53l0x/vl53l0x_api_calibration.o \
./Drivers/BSP/Components/vl53l0x/vl53l0x_api_core.o \
./Drivers/BSP/Components/vl53l0x/vl53l0x_api_ranging.o \
./Drivers/BSP/Components/vl53l0x/vl53l0x_api_strings.o \
./Drivers/BSP/Components/vl53l0x/vl53l0x_platform_log.o 

C_DEPS += \
./Drivers/BSP/Components/vl53l0x/vl53l0x_api.d \
./Drivers/BSP/Components/vl53l0x/vl53l0x_api_calibration.d \
./Drivers/BSP/Components/vl53l0x/vl53l0x_api_core.d \
./Drivers/BSP/Components/vl53l0x/vl53l0x_api_ranging.d \
./Drivers/BSP/Components/vl53l0x/vl53l0x_api_strings.d \
./Drivers/BSP/Components/vl53l0x/vl53l0x_platform_log.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/Components/vl53l0x/vl53l0x_api.o: C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x/vl53l0x_api.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/Components/vl53l0x/vl53l0x_api_calibration.o: C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x/vl53l0x_api_calibration.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/Components/vl53l0x/vl53l0x_api_core.o: C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x/vl53l0x_api_core.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/Components/vl53l0x/vl53l0x_api_ranging.o: C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x/vl53l0x_api_ranging.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/Components/vl53l0x/vl53l0x_api_strings.o: C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x/vl53l0x_api_strings.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/Components/vl53l0x/vl53l0x_platform_log.o: C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x/vl53l0x_platform_log.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


