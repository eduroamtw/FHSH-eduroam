@echo off
ECHO 鳳新高中校園無線網路 Windows 自動設定
ECHO for IA32/AMD64

:main
CLS
ECHO 鳳新高中校內網路自動設定工具
ECHO by ChiLin.H
ECHO 特別備註：由於高雄資教亂搞，因此如需使用教育雲 (@mail.edu.tw) 
ECHO 帳號在校外連線，或回到校內，需先執行選項 3 轉換設定檔。
ECHO .
ECHO 請選擇你要執行的操作：
ECHO 0.離開
ECHO 1.安裝設定檔
ECHO 2.移除設定檔
ECHO 3.教育雲 eduroam 設定檔轉換
set /p mode=請輸入代號(如1)：
if %mode%==0 goto exit
if %mode%==1 goto add
if %mode%==2 goto rm
if %mode%==3 goto sw
goto main

:add
CLS
ECHO # 安裝設定檔
ECHO 請選擇你的帳號結尾：
ECHO 0.回上頁
ECHO 1.鳳新高中 (@fhsh.khc.edu.tw)
ECHO 2.教育雲端帳號 (@mail.edu.tw)
ECHO 3.高雄資教 (@kh.edu.tw)

set /p mode=請輸入代號(如1)：
if %mode%==0 goto main
if %mode%==1 goto fhsh
if %mode%==2 goto twedu
if %mode%==3 goto kh
goto add

:fhsh
CLS
ECHO 正在安裝鳳新高中帳號設定檔...
ECHO 清除原有 eduroam 設定檔與帳密中...
ArubaWifiCfg_Vista.exe -delete /SSID:eduroam >NUL
ECHO 安裝 eduroam 設定檔中...
ArubaWifiCfg_Vista.exe -add /SSID:eduroam /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE >NUL
ECHO 清除原有 Fhsh-Eduroam 設定檔與帳密中...
ArubaWifiCfg_Vista.exe -delete /SSID:Fhsh-Eduroam >NUL
ECHO 安裝 Fhsh-Eduroam 設定檔中...
ArubaWifiCfg_Vista.exe -add /SSID:Fhsh-Eduroam /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE >NUL
ECHO 設定完成！按下任意鍵返回主選單。
pause
goto main

:twedu
CLS
ECHO 正在安裝教育雲端帳號設定檔...
ECHO 清除原有 eduroam 設定檔與帳密中...
ArubaWifiCfg_Vista.exe -delete /SSID:eduroam >NUL
ECHO 安裝 eduroam (教育雲-高雄資教特規版) 設定檔中...
ArubaWifiCfg_Vista.exe -add /SSID:eduroam /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE >NUL
ECHO 清除原有 Fhsh-Eduroam 設定檔與帳密中...
ArubaWifiCfg_Vista.exe -delete /SSID:Fhsh-Eduroam >NUL
ECHO 安裝 Fhsh-Eduroam 設定檔中...
ArubaWifiCfg_Vista.exe -add /SSID:Fhsh-Eduroam /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:MSCHAPv2 /EnableFastReconnect:TRUE >NUL
ECHO 設定完成！按下任意鍵返回主選單。
pause
goto main

:kh
CLS
ECHO 正在安裝高雄資教設定檔...
ECHO 清除原有 eduroam 設定檔與帳密中...
ArubaWifiCfg_Vista.exe -delete /SSID:eduroam >NUL
ECHO 安裝 eduroam 設定檔中...
ArubaWifiCfg_Vista.exe -add /SSID:eduroam /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE >NUL
ECHO 清除原有 Fhsh-Eduroam 設定檔與帳密中...
ArubaWifiCfg_Vista.exe -delete /SSID:Fhsh-Eduroam >NUL
ECHO 安裝 Fhsh-Eduroam 設定檔中...
ArubaWifiCfg_Vista.exe -add /SSID:Fhsh-Eduroam /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE >NUL
ECHO 清除原有 KH 設定檔與帳密中...
ArubaWifiCfg_Vista.exe -delete /SSID:KH >NUL
ECHO 安裝 KH 設定檔中...
ArubaWifiCfg_Vista.exe -add /SSID:KH /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE >NUL
ECHO 清除原有 KH-fhsh 設定檔與帳密中...
ArubaWifiCfg_Vista.exe -delete /SSID:KH-fhsh >NUL
ECHO 安裝 KH-fhsh 設定檔中...
ArubaWifiCfg_Vista.exe -add /SSID:KH-fhsh /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE >NUL
ECHO 設定完成！按下任意鍵返回主選單。
pause
goto main

:rm
CLS
ECHO # 移除設定檔
ECHO 請選擇你要移除的設定檔：
ECHO 0.回上頁
ECHO 1.移除 eduroam 設定檔
ECHO 2.移除 Fhsh-Eduroam 設定檔
ECHO 3.移除 KH 設定檔
ECHO 4.移除 KH-fhsh 設定檔
ECHO 5.移除上述所有設定檔
set /p mode=請輸入代號(如1)：
if %mode%==0 goto main
if %mode%==1 goto rmedur
if %mode%==2 goto rmfhshedur
if %mode%==3 goto rmkh
if %mode%==4 goto rmkhfhsh
if %mode%==5 goto rmall
goto rm

:rmedur
CLS
ECHO 清除原有 eduroam 設定檔與帳密中...
ArubaWifiCfg_Vista.exe -delete /SSID:eduroam >NUL
ECHO 清除完成！按下任意鍵返回主選單。
pause
goto main

:rmfhshedur
CLS
ECHO 清除原有 Fhsh-Eduroam 設定檔與帳密中...
ArubaWifiCfg_Vista.exe -delete /SSID:Fhsh-Eduroam >NUL
ECHO 清除完成！按下任意鍵返回主選單。
pause
goto main

:rmkh
CLS
ECHO 清除原有 KH 設定檔與帳密中...
ArubaWifiCfg_Vista.exe -delete /SSID:KH >NUL
ECHO 清除完成！按下任意鍵返回主選單。
pause
goto main

:rmkhfhsh
CLS
ECHO 清除原有 KH-fhsh 設定檔與帳密中...
ArubaWifiCfg_Vista.exe -delete /SSID:KH-fhsh >NUL
ECHO 清除完成！按下任意鍵返回主選單。
pause
goto main

:rmall
CLS
ECHO 清除原有 eduroam 設定檔與帳密中...
ArubaWifiCfg_Vista.exe -delete /SSID:eduroam >NUL
ECHO 清除原有 Fhsh-Eduroam 設定檔與帳密中...
ArubaWifiCfg_Vista.exe -delete /SSID:Fhsh-Eduroam >NUL
ECHO 清除原有 KH 設定檔與帳密中...
ArubaWifiCfg_Vista.exe -delete /SSID:KH >NUL
ECHO 清除原有 KH-fhsh 設定檔與帳密中...
ArubaWifiCfg_Vista.exe -delete /SSID:KH-fhsh >NUL
ECHO 清除完成！按下任意鍵返回主選單。
pause
goto main

:sw
CLS
ECHO # 教育雲 eduroam 設定檔轉換
ECHO 請選擇你要執行的操作：
ECHO 0.回上頁
ECHO 1.高雄資教 轉換 標準設定
ECHO 2.標準設定 轉換 高雄資教
set /p mode=請輸入代號(如1)：
if %mode%==0 goto main
if %mode%==1 goto tostd
if %mode%==2 goto tokh
goto sw

:tostd
CLS
ECHO 正在安裝教育雲端帳號 (標準版) 設定檔...
ECHO 清除原有 eduroam 設定檔與帳密中...
ArubaWifiCfg_Vista.exe -delete /SSID:eduroam >NUL
ECHO 安裝 eduroam (教育雲-標準版) 設定檔中...
ArubaWifiCfg_Vista.exe -add /SSID:eduroam /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:MSCHAPv2 /EnableFastReconnect:TRUE >NUL
ECHO 設定完成！按下任意鍵返回主選單。
pause
goto main

:tokh
CLS
ECHO 正在安裝教育雲端帳號 (高雄資教特規版) 設定檔...
ECHO 清除原有 eduroam 設定檔與帳密中...
ArubaWifiCfg_Vista.exe -delete /SSID:eduroam >NUL
ECHO 安裝 eduroam (教育雲-高雄資教特規版) 設定檔中...
ArubaWifiCfg_Vista.exe -add /SSID:eduroam /Authentication:WPA2 /Encryption:AES /EAPType:PEAP /InnerAuthentication:GTC /EnableFastReconnect:TRUE >NUL
ECHO 設定完成！按下任意鍵返回主選單。
pause
goto main

:exit