@echo off
ECHO ��s�����ն�L�u���� Windows �۰ʳ]�w
ECHO for IA32/AMD64

:main
CLS
ECHO ��s�����դ������۰ʳ]�w�u��
ECHO by ChiLin.H
ECHO �S�O�Ƶ��G�ѩ󰪶���ж÷d�A�]���p�ݨϥαШ|�� (@mail.edu.tw) 
ECHO �b���b�ե~�s�u�A�Φ^��դ��A�ݥ�����ﶵ 3 �ഫ�]�w�ɡC
ECHO .
ECHO �п�ܧA�n���檺�ާ@�G
ECHO 0.���}
ECHO 1.�w�˳]�w��
ECHO 2.�����]�w��
ECHO 3.�Ш|�� eduroam �]�w���ഫ
set /p mode=�п�J�N��(�p1)�G
if %mode%==0 goto exit
if %mode%==1 goto add
if %mode%==2 goto rm
if %mode%==3 goto sw
goto main

:add
CLS
ECHO # �w�˳]�w��
ECHO �п�ܧA���b�������G
ECHO 0.�^�W��
ECHO 1.��s���� (@fhsh.khc.edu.tw)
ECHO 2.�Ш|���ݱb�� (@mail.edu.tw)
ECHO 3.������� (@kh.edu.tw)

set /p mode=�п�J�N��(�p1)�G
if %mode%==0 goto main
if %mode%==1 goto fhsh
if %mode%==2 goto twedu
if %mode%==3 goto kh
goto add

:fhsh
CLS
ECHO ���b�w�˻�s�����b���]�w��...
ECHO �M���즳 eduroam �]�w�ɻP�b�K��...
ArubaWifiCfg_Vista.exe -delete /SSID:eduroam >NUL
ECHO �w�� eduroam �]�w�ɤ�...
ArubaWifiCfg_Vista.exe -add /SSID:eduroam /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE >NUL
ECHO �M���즳 Fhsh-Eduroam �]�w�ɻP�b�K��...
ArubaWifiCfg_Vista.exe -delete /SSID:Fhsh-Eduroam >NUL
ECHO �w�� Fhsh-Eduroam �]�w�ɤ�...
ArubaWifiCfg_Vista.exe -add /SSID:Fhsh-Eduroam /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE >NUL
ECHO �]�w�����I���U���N���^�D���C
pause
goto main

:twedu
CLS
ECHO ���b�w�˱Ш|���ݱb���]�w��...
ECHO �M���즳 eduroam �]�w�ɻP�b�K��...
ArubaWifiCfg_Vista.exe -delete /SSID:eduroam >NUL
ECHO �w�� eduroam (�Ш|��-������ЯS�W��) �]�w�ɤ�...
ArubaWifiCfg_Vista.exe -add /SSID:eduroam /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE >NUL
ECHO �M���즳 Fhsh-Eduroam �]�w�ɻP�b�K��...
ArubaWifiCfg_Vista.exe -delete /SSID:Fhsh-Eduroam >NUL
ECHO �w�� Fhsh-Eduroam �]�w�ɤ�...
ArubaWifiCfg_Vista.exe -add /SSID:Fhsh-Eduroam /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:MSCHAPv2 /EnableFastReconnect:TRUE >NUL
ECHO �]�w�����I���U���N���^�D���C
pause
goto main

:kh
CLS
ECHO ���b�w�˰�����г]�w��...
ECHO �M���즳 eduroam �]�w�ɻP�b�K��...
ArubaWifiCfg_Vista.exe -delete /SSID:eduroam >NUL
ECHO �w�� eduroam �]�w�ɤ�...
ArubaWifiCfg_Vista.exe -add /SSID:eduroam /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE >NUL
ECHO �M���즳 Fhsh-Eduroam �]�w�ɻP�b�K��...
ArubaWifiCfg_Vista.exe -delete /SSID:Fhsh-Eduroam >NUL
ECHO �w�� Fhsh-Eduroam �]�w�ɤ�...
ArubaWifiCfg_Vista.exe -add /SSID:Fhsh-Eduroam /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE >NUL
ECHO �M���즳 KH �]�w�ɻP�b�K��...
ArubaWifiCfg_Vista.exe -delete /SSID:KH >NUL
ECHO �w�� KH �]�w�ɤ�...
ArubaWifiCfg_Vista.exe -add /SSID:KH /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE >NUL
ECHO �M���즳 KH-fhsh �]�w�ɻP�b�K��...
ArubaWifiCfg_Vista.exe -delete /SSID:KH-fhsh >NUL
ECHO �w�� KH-fhsh �]�w�ɤ�...
ArubaWifiCfg_Vista.exe -add /SSID:KH-fhsh /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE >NUL
ECHO �]�w�����I���U���N���^�D���C
pause
goto main

:rm
CLS
ECHO # �����]�w��
ECHO �п�ܧA�n�������]�w�ɡG
ECHO 0.�^�W��
ECHO 1.���� eduroam �]�w��
ECHO 2.���� Fhsh-Eduroam �]�w��
ECHO 3.���� KH �]�w��
ECHO 4.���� KH-fhsh �]�w��
ECHO 5.�����W�z�Ҧ��]�w��
set /p mode=�п�J�N��(�p1)�G
if %mode%==0 goto main
if %mode%==1 goto rmedur
if %mode%==2 goto rmfhshedur
if %mode%==3 goto rmkh
if %mode%==4 goto rmkhfhsh
if %mode%==5 goto rmall
goto rm

:rmedur
CLS
ECHO �M���즳 eduroam �]�w�ɻP�b�K��...
ArubaWifiCfg_Vista.exe -delete /SSID:eduroam >NUL
ECHO �M�������I���U���N���^�D���C
pause
goto main

:rmfhshedur
CLS
ECHO �M���즳 Fhsh-Eduroam �]�w�ɻP�b�K��...
ArubaWifiCfg_Vista.exe -delete /SSID:Fhsh-Eduroam >NUL
ECHO �M�������I���U���N���^�D���C
pause
goto main

:rmkh
CLS
ECHO �M���즳 KH �]�w�ɻP�b�K��...
ArubaWifiCfg_Vista.exe -delete /SSID:KH >NUL
ECHO �M�������I���U���N���^�D���C
pause
goto main

:rmkhfhsh
CLS
ECHO �M���즳 KH-fhsh �]�w�ɻP�b�K��...
ArubaWifiCfg_Vista.exe -delete /SSID:KH-fhsh >NUL
ECHO �M�������I���U���N���^�D���C
pause
goto main

:rmall
CLS
ECHO �M���즳 eduroam �]�w�ɻP�b�K��...
ArubaWifiCfg_Vista.exe -delete /SSID:eduroam >NUL
ECHO �M���즳 Fhsh-Eduroam �]�w�ɻP�b�K��...
ArubaWifiCfg_Vista.exe -delete /SSID:Fhsh-Eduroam >NUL
ECHO �M���즳 KH �]�w�ɻP�b�K��...
ArubaWifiCfg_Vista.exe -delete /SSID:KH >NUL
ECHO �M���즳 KH-fhsh �]�w�ɻP�b�K��...
ArubaWifiCfg_Vista.exe -delete /SSID:KH-fhsh >NUL
ECHO �M�������I���U���N���^�D���C
pause
goto main

:sw
CLS
ECHO # �Ш|�� eduroam �]�w���ഫ
ECHO �п�ܧA�n���檺�ާ@�G
ECHO 0.�^�W��
ECHO 1.������� �ഫ �зǳ]�w
ECHO 2.�зǳ]�w �ഫ �������
set /p mode=�п�J�N��(�p1)�G
if %mode%==0 goto main
if %mode%==1 goto tostd
if %mode%==2 goto tokh
goto sw

:tostd
CLS
ECHO ���b�w�˱Ш|���ݱb�� (�зǪ�) �]�w��...
ECHO �M���즳 eduroam �]�w�ɻP�b�K��...
ArubaWifiCfg_Vista.exe -delete /SSID:eduroam >NUL
ECHO �w�� eduroam (�Ш|��-�зǪ�) �]�w�ɤ�...
ArubaWifiCfg_Vista.exe -add /SSID:eduroam /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:MSCHAPv2 /EnableFastReconnect:TRUE >NUL
ECHO �]�w�����I���U���N���^�D���C
pause
goto main

:tokh
CLS
ECHO ���b�w�˱Ш|���ݱb�� (������ЯS�W��) �]�w��...
ECHO �M���즳 eduroam �]�w�ɻP�b�K��...
ArubaWifiCfg_Vista.exe -delete /SSID:eduroam >NUL
ECHO �w�� eduroam (�Ш|��-������ЯS�W��) �]�w�ɤ�...
ArubaWifiCfg_Vista.exe -add /SSID:eduroam /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE >NUL
ECHO �]�w�����I���U���N���^�D���C
pause
goto main

:exit