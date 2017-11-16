/**
  @page AWS AWS Cloud application

  @verbatim
  ******************************************************************************
  * @file    readme.txt 
  * @author  MCD Application Team
  * @version V1.0.0
  * @date    28-March-2017
  * @brief   Description of AWS Cloud application.
  ******************************************************************************
  *
  * Copyright (c) 2017 STMicroelectronics International N.V. All rights reserved.
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
  @endverbatim

@par Application Description 


This application implements an Amazon AWS Cloud IoT client for B-L475E-IOT01 board 
using on-board Inventek ISM43362 Wifi module connectivity, and mbedTLS for
secure network communication.

The application connects to Amazon AWS IoT Cloud with the credentials provided
by the user. When the User button is pressed, it sends board's sensors data to 
the AWS server (with MQTT protocol).

This application supports 3 possible configuration:
- B-L475E-IOT01-NOSENSOR: No sensors information to be send, only the state of the
                          led is published under the cloud.
- B-L475E-IOT01         : Sensors information will be sent to the cloud. The Led
                          desired value will be published once the User button is 
                          pressed.
- B-L475E-IOT01-FIREWALL: Sensors information will be sent to the cloud once User
                          button is pushed. This configuration supports the FireWall
                          library by calling the "FireWallLib.bin" located under Binary.
                          To customize this library, user can modify the binary file.
                          This can easly done by configuring the LibFireWall project.
                          Once this latter is compiled, a new "FireWallLib.bin" file
                          is generated under AWS/Binary folder. It will override the 
                          old file .

@par Directory contents

   - Cloud/AWS/Binary/FireWallLib.bin                 A precompiled binary file to be used as Firewall library.
   - Cloud/AWS/Src/main.c                             Main application file
   - Cloud/AWS/Src/stm32l4xx_it.c                     STM32 interrupt handlers 
   - Cloud/AWS/Src/stm32l4xx_hal_msp.c                specific initializations
   - Cloud/AWS/Src/system_stm32l4xx.c                 system initialization
   - Cloud/AWS/Src/flash_l4.c                         flash programing interface for L4.
   - Cloud/AWS/Src/vl53l0x_proximity.c                Proximity sensor APIs
   - Cloud/AWS/Inc/main.h                             Header containing config parameters for the application.
   - Cloud/AWS/Inc/stm32l4xx_it.h                     STM32 interrupt handlers header file
   - Cloud/AWS/Inc/vl53l0x_proximity.h                Header of vl53l0x_proximity.c file
   - Cloud/AWS/Inc/stm32l4xx_hal_conf.h               HAL configuration file
   - Cloud/AWS/Inc/es_wifi_conf.h                     ES Wifi configuration file
   
@par Hardware and Software environment

  - This example runs on B-L475E-IOT01 board (MB1297 rev C01).
  
  - A WiFi access point is required.

  - an Amazon AWS account is required. Security keys and endpoint for AWS IoT 
    service must be created.

    see http://docs.aws.amazon.com/iot/latest/developerguide/iot-gs.html

@par How to use it ? 

In order to make the program work, you must do the following:

 - WARNING: before opening the project with any toolchain be sure your folder
   installation path is not too in-depth since the toolchain may report errors
   after building.

 - Open IAR toolchain and compile the project (see the release note for detailed 
   information about the version). Alternatively you can use the Keil uVision 
   toolchain (see the release note for detailed information about the version). 
   Alternatively you can use the System Workbench for STM32 (see the release note 
   for detailed information about the version). 

 - Program the firmware on the STM32 board: you can copy (or drag and drop) the 
   binary file under Projects\B-L475E-IOT01\Applications\Cloud\AWS\Binary
   to the USB mass storage location created when you plug the STM32 
   board to your PC. If the host is a Linux PC, the STM32 device can be found in 
   the /media folder with the name "DIS_L4IOT". For example, if the created mass 
   storage location is "/media/DIS_L4IOT", then the command to program the board 
   with a binary file named "my_firmware.bin" is simply: cp my_firmware.bin 
   /media/DIS_L4IOT. 

   Alternatively, you can program the STM32 board directly through one of the 
   supported development toolchains.
  
 - configure the required settings (to be done only once): 
   - when the board is connected to a PC with USB (ST-LINK USB port), 
     open a serial terminal emulator, find the board's COM port and configure it with:
      - 8N1, 115200 bauds, no HW flow control
      - set the line endings to LF or CR-LF
   - at first boot, enter the required parameters:
     - Wifi network configuration (SSID, security mode, password).
     - enter the TLS network security keys needed for Amazon AWS connection (root CA key, 
       device certificate, private key).
     - enter the Amazon AWS IoT end-point (Amazon server address) and device ID.
   - after the parameters are configured, it is possible to change them by restarting the board 
     and pressing User button (blue button) just after boot.

@par Connectivity test

  - By default the AWS project tries to automatically connect to Amazon AWS IoT cloud 
    (using parameters set above). 

  - Press the User button (blue button) to publish Led desired value. This will make toggle the Led via AWS IoT

  - The sensor data will be published around every 10 seconds


 * <h3><center>&copy; COPYRIGHT STMicroelectronics</center></h3>
 */
