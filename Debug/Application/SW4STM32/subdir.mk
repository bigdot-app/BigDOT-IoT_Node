################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/SW4STM32/startup_stm32l475xx.s 

C_SRCS += \
C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/SW4STM32/syscalls.c 

OBJS += \
./Application/SW4STM32/startup_stm32l475xx.o \
./Application/SW4STM32/syscalls.o 

C_DEPS += \
./Application/SW4STM32/syscalls.d 


# Each subdirectory must supply rules for building sources it contributes
Application/SW4STM32/startup_stm32l475xx.o: C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/SW4STM32/startup_stm32l475xx.s
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Assembler'
	@echo $(PWD)
	arm-none-eabi-as -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -g -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/SW4STM32/syscalls.o: C://STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/SW4STM32/syscalls.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32L475xx '-DMQTTCLIENT_PLATFORM_HEADER=MQTTCMSIS.h' -DENABLE_IOT_INFO -DENABLE_IOT_ERROR '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DSENSOR -DRFU -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/Cloud/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/B-L475E-IOT01" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/Common" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/hts221" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lis3mdl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lps22hb" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/lsm6dsl" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/vl53l0x" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/AWS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Middlewares/Third_Party/mbedTLS/include" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/Common/AWS/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Projects/B-L475E-IOT01/Applications/WiFi/Inc" -I"C:/STM32L4_DK_IoT_Node_Seminar/Hands-on/Labs/Drivers/BSP/Components/es_wifi"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


