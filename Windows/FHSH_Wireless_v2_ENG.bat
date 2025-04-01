@echo off
ECHO FHSH Campus Wireless Network Windows Auto Setup
ECHO for IA32/AMD64

:main
CLS
ECHO FHSH Network Auto Setup Tool
ECHO by ChiLin.H
ECHO Special Note: Due to issues with the kh.edu.tw, 
ECHO if you need to use the non-KH account to connect off-campus or return to campus,
ECHO you must first run Option 3 to switch the configuration file. 
ECHO .
ECHO Please select the operation you want to perform:
ECHO 0. Exit
ECHO 1. Install Configuration File
ECHO 2. Remove Configuration File
ECHO 3. mail.edu.tw eduroam Configuration File Conversion
set /p mode=Please enter the code (e.g., 1):
if %mode%==0 goto exit
if %mode%==1 goto add
if %mode%==2 goto rm
if %mode%==3 goto sw
goto main

:add
CLS
ECHO # Install Configuration File
ECHO Please select your account domain:
ECHO 0. Back to previous menu
ECHO 1. @fhsh.khc.edu.tw
ECHO 2. @mail.edu.tw
ECHO 3. @kh.edu.tw

set /p mode=Please enter the code (e.g., 1):
if %mode%==0 goto main
if %mode%==1 goto fhsh
if %mode%==2 goto twedu
if %mode%==3 goto kh
goto add

:fhsh
CLS
ECHO Installing FHSH account configuration file...
ECHO Clearing existing eduroam configuration file and credentials...
ArubaWifiCfg_Vista.exe -delete /SSID:eduroam >NUL
ECHO Installing eduroam configuration file...
ArubaWifiCfg_Vista.exe -add /SSID:eduroam /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE >NUL
ECHO Clearing existing Fhsh-Eduroam configuration file and credentials...
ArubaWifiCfg_Vista.exe -delete /SSID:Fhsh-Eduroam >NUL
ECHO Installing Fhsh-Eduroam configuration file...
ArubaWifiCfg_Vista.exe -add /SSID:Fhsh-Eduroam /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE >NUL
ECHO Setup completed! Press any key to return to the main menu.
pause
goto main

:twedu
CLS
ECHO Installing mail.edu.tw account configuration file...
ECHO Clearing existing eduroam configuration file and credentials...
ArubaWifiCfg_Vista.exe -delete /SSID:eduroam >NUL
ECHO Installing Eduroam (mail.edu.tw via kh.edu.tw Offload Edition) configuration file...
ArubaWifiCfg_Vista.exe -add /SSID:eduroam /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE >NUL
ECHO Clearing existing Fhsh-Eduroam configuration file and credentials...
ArubaWifiCfg_Vista.exe -delete /SSID:Fhsh-Eduroam >NUL
ECHO Installing Fhsh-Eduroam configuration file...
ArubaWifiCfg_Vista.exe -add /SSID:Fhsh-Eduroam /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:MSCHAPv2 /EnableFastReconnect:TRUE >NUL
ECHO Setup completed! Press any key to return to the main menu.
pause
goto main

:kh
CLS
ECHO Installing kh.edu.tw configuration file...
ECHO Clearing existing eduroam configuration file and credentials...
ArubaWifiCfg_Vista.exe -delete /SSID:eduroam >NUL
ECHO Installing eduroam configuration file...
ArubaWifiCfg_Vista.exe -add /SSID:eduroam /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE >NUL
ECHO Clearing existing Fhsh-Eduroam configuration file and credentials...
ArubaWifiCfg_Vista.exe -delete /SSID:Fhsh-Eduroam >NUL
ECHO Installing Fhsh-Eduroam configuration file...
ArubaWifiCfg_Vista.exe -add /SSID:Fhsh-Eduroam /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE >NUL
ECHO Clearing existing KH configuration file and credentials...
ArubaWifiCfg_Vista.exe -delete /SSID:KH >NUL
ECHO Installing KH configuration file...
ArubaWifiCfg_Vista.exe -add /SSID:KH /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE >NUL
ECHO Clearing existing KH-fhsh configuration file and credentials...
ArubaWifiCfg_Vista.exe -delete /SSID:KH-fhsh >NUL
ECHO Installing KH-fhsh configuration file...
ArubaWifiCfg_Vista.exe -add /SSID:KH-fhsh /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE >NUL
ECHO Setup completed! Press any key to return to the main menu.
pause
goto main

:rm
CLS
ECHO # Remove Configuration File
ECHO Please select the configuration file you want to remove:
ECHO 0. Back to previous menu
ECHO 1. Remove eduroam configuration file
ECHO 2. Remove Fhsh-Eduroam configuration file
ECHO 3. Remove KH configuration file
ECHO 4. Remove KH-fhsh configuration file
ECHO 5. Remove all configuration files
set /p mode=Please enter the code (e.g., 1):
if %mode%==0 goto main
if %mode%==1 goto rmedur
if %mode%==2 goto rmfhshedur
if %mode%==3 goto rmkh
if %mode%==4 goto rmkhfhsh
if %mode%==5 goto rmall
goto rm

:rmedur
CLS
ECHO Clearing existing eduroam configuration file and credentials...
ArubaWifiCfg_Vista.exe -delete /SSID:eduroam >NUL
ECHO Clearing completed! Press any key to return to the main menu.
pause
goto main

:rmfhshedur
CLS
ECHO Clearing existing Fhsh-Eduroam configuration file and credentials...
ArubaWifiCfg_Vista.exe -delete /SSID:Fhsh-Eduroam >NUL
ECHO Clearing completed! Press any key to return to the main menu.
pause
goto main

:rmkh
CLS
ECHO Clearing existing KH configuration file and credentials...
ArubaWifiCfg_Vista.exe -delete /SSID:KH >NUL
ECHO Clearing completed! Press any key to return to the main menu.
pause
goto main

:rmkhfhsh
CLS
ECHO Clearing existing KH-fhsh configuration file and credentials...
ArubaWifiCfg_Vista.exe -delete /SSID:KH-fhsh >NUL
ECHO Clearing completed! Press any key to return to the main menu.
pause
goto main

:rmall
CLS
ECHO Clearing existing eduroam configuration file and credentials...
ArubaWifiCfg_Vista.exe -delete /SSID:eduroam >NUL
ECHO Clearing existing Fhsh-Eduroam configuration file and credentials...
ArubaWifiCfg_Vista.exe -delete /SSID:Fhsh-Eduroam >NUL
ECHO Clearing existing KH configuration file and credentials...
ArubaWifiCfg_Vista.exe -delete /SSID:KH >NUL
ECHO Clearing existing KH-fhsh configuration file and credentials...
ArubaWifiCfg_Vista.exe -delete /SSID:KH-fhsh >NUL
ECHO Clearing completed! Press any key to return to the main menu.
pause
goto main

:sw
CLS
ECHO # mail.edu.tw eduroam Configuration File Conversion
ECHO Please select the operation you want to perform:
ECHO 0. Back to previous menu
ECHO 1. Convert kh.edu.tw ver. to Standard ver. Configuration
ECHO 2. Convert Standard ver. Configuration to kh.edu.tw ver.
set /p mode=Please enter the code (e.g., 1):
if %mode%==0 goto main
if %mode%==1 goto tostd
if %mode%==2 goto tokh
goto sw

:tostd
CLS
ECHO Installing mail.edu.tw (Standard Edition) configuration file...
ECHO Clearing existing eduroam configuration file and credentials...
ArubaWifiCfg_Vista.exe -delete /SSID:eduroam >NUL
ECHO Installing Eduroam (mail.edu.tw (Standard Edition)) configuration file...
ArubaWifiCfg_Vista.exe -add /SSID:eduroam /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:MSCHAPv2 /EnableFastReconnect:TRUE >NUL
ECHO Setup completed! Press any key to return to the main menu.
pause
goto main

:tokh
CLS
ECHO Installing mail.edu.tw (kh.edu.tw Special Edition) configuration file...
ECHO Clearing existing eduroam configuration file and credentials...
ArubaWifiCfg_Vista.exe -delete /SSID:eduroam >NUL
ECHO Installing Eduroam ((kh.edu.tw Special Edition)) configuration file...
ArubaWifiCfg_Vista.exe -add /SSID:eduroam /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE >NUL
ECHO Setup completed! Press any key to return to the main menu.
pause
goto main

:exit