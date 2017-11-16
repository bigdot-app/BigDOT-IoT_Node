################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Middlewares/Third_Party/mbedTLS2.4/subdir.mk
-include Middlewares/Third_Party/AWS/subdir.mk
-include Drivers/STM32L4xx_HAL_Driver/subdir.mk
-include Drivers/CMSIS/subdir.mk
-include Drivers/BSP/Components/vl53l0x/subdir.mk
-include Drivers/BSP/Components/LSM6DSL/subdir.mk
-include Drivers/BSP/Components/LPS22HB/subdir.mk
-include Drivers/BSP/Components/LIS3MDL/subdir.mk
-include Drivers/BSP/Components/HTS221/subdir.mk
-include Drivers/BSP/Components/ES_WIFI/subdir.mk
-include Drivers/BSP/B-L475E-IOT01/subdir.mk
-include Application/WIFI/subdir.mk
-include Application/User/subdir.mk
-include Application/SW4STM32/subdir.mk
-include Application/Common/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: B-L475E-IOT01.elf

# Tool invocations
B-L475E-IOT01.elf: $(OBJS) $(USER_OBJS) ../STM32L475VGTx_FLASH.ld
	@echo 'Building target: $@'
	@echo 'Invoking: MCU GCC Linker'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -specs=nosys.specs -T"../STM32L475VGTx_FLASH.ld" -Wl,-Map=output.map -Wl,--gc-sections -o "B-L475E-IOT01.elf" @"objects.list" $(USER_OBJS) $(LIBS) -lm
	@echo 'Finished building target: $@'
	@echo ' '
	$(MAKE) --no-print-directory post-build

# Other Targets
clean:
	-$(RM) *
	-@echo ' '

post-build:
	-@echo 'Generating binary and Printing size information:'
	arm-none-eabi-objcopy -O ihex "B-L475E-IOT01.elf" "B-L475E-IOT01.hex"
	arm-none-eabi-size "B-L475E-IOT01.elf"
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY: post-build

-include ../makefile.targets
