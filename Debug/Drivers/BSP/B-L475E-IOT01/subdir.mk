################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01.c \
C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_accelero.c \
C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_gyro.c \
C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_hsensor.c \
C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_magneto.c \
C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_psensor.c \
C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_tsensor.c 

OBJS += \
./Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01.o \
./Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_accelero.o \
./Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_gyro.o \
./Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_hsensor.o \
./Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_magneto.o \
./Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_psensor.o \
./Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_tsensor.o 

C_DEPS += \
./Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01.d \
./Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_accelero.d \
./Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_gyro.d \
./Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_hsensor.d \
./Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_magneto.d \
./Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_psensor.d \
./Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_tsensor.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01.o: C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_accelero.o: C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_accelero.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_gyro.o: C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_gyro.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_hsensor.o: C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_hsensor.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_magneto.o: C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_magneto.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_psensor.o: C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_psensor.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_tsensor.o: C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01/stm32l475e_iot01_tsensor.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


