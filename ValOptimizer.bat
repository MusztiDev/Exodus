@echo off
SETLOCAL EnableDelayedExpansion
color 03

:: Definiowanie zmiennej counter na początku skryptu
set "counter=0"

:starting

echo.
echo             ::::::::::       :::    :::        ::::::::        :::::::::        :::    :::        ::::::::  
echo             :+:              :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+: 
echo             +:+               +:+  +:+        +:+    +:+       +:+    +:+       +:+        
echo             +#++:++#           +#++:+         +#+    +:+       +#+    +:+       +:+    +:+       +#++:++#++ 
echo             +#+               +#+  +#+        +#+    +#+       +#+    +#+       +#+    +#+               +#+ 
echo             #+#              #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+# 
echo             ##########       ###    ###        ########        #########         ########         ########      
echo.
echo ________________________________________________________________________________________________________________________  
echo                                               Asking for Admin priveleges
echo ________________________________________________________________________________________________________________________ 

Reg.exe add HKLM /F >nul 2>&1
if %errorlevel% neq 0 (
    start "" /wait /I /min powershell -NoProfile -Command start -verb runas "'%~s0'" && exit /b
)

cls

title Exodus Fortnite Settings Configuration Utility

:entry

echo.
echo             ::::::::::       :::    :::        ::::::::        :::::::::        :::    :::        ::::::::  
echo             :+:              :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+: 
echo             +:+               +:+  +:+        +:+    +:+       +:+    +:+       +:+        
echo             +#++:++#           +#++:+         +#+    +:+       +#+    +:+       +:+    +:+       +#++:++#++ 
echo             +#+               +#+  +#+        +#+    +#+       +#+    +#+       +#+    +#+               +#+ 
echo             #+#              #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+# 
echo             ##########       ###    ###        ########        #########         ########         ########     
echo.
echo ________________________________________________________________________________________________________________________  
echo                                                   Valorant Optimizer
echo ________________________________________________________________________________________________________________________ 
echo.
echo.
echo.
echo.
echo                               This script is provided by Muszti. All rights reserved!
echo                     Unauthorized copying of this software, via any medium, is strictly prohibited.
echo                                           Proprietary and confidential.
echo.
echo.
echo.
echo                                     Press any key to continue with the script...                   
pause > nul
cls

:menu
cls
echo.
echo             ::::::::::       :::    :::        ::::::::        :::::::::        :::    :::        ::::::::  
echo             :+:              :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+: 
echo             +:+               +:+  +:+        +:+    +:+       +:+    +:+       +:+        
echo             +#++:++#           +#++:+         +#+    +:+       +#+    +:+       +:+    +:+       +#++:++#++ 
echo             +#+               +#+  +#+        +#+    +#+       +#+    +#+       +#+    +#+               +#+ 
echo             #+#              #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+# 
echo             ##########       ###    ###        ########        #########         ########         ########       
echo.
echo ________________________________________________________________________________________________________________________  
echo                                                   Valorant Optimizer
echo ________________________________________________________________________________________________________________________ 
echo Choose which script do you want to run:
echo.
echo [1] Valorant In-Game Settings 
echo [2] Nvidia Settings
echo [3] High QoS
echo [4] High Priority
echo [Q] Exit 
echo.

set /p USER_CHOICE="Enter your choice (1-5 or Q): "

if "%USER_CHOICE%"=="1" (
    goto VIGS
) else if "%USER_CHOICE%"=="2" (
    goto VNS
) else if /I "%USER_CHOICE%"=="Q" (
    goto Quit
) else if /I "%USER_CHOICE%"=="3" (
    goto VQoS 
) else if /I "%USER_CHOICE%"=="4" (
    goto HIP
) else (
    goto EndScript
)
:: Ustawienie zmiennej URL do pobrania pliku
set "url=https://github.com/MusztiDev/Exodus/releases/download/exodus/GameUserSettings.ini"
:: Ustawienie ścieżki do głównego folderu konfiguracyjnego Valoranta
set "config_folder=%USERPROFILE%\AppData\Local\Valorant\Saved\Config"
:: Ustawienie ścieżki do folderu Backup na Pulpicie
set "backup_folder=%USERPROFILE%\Desktop\ExodusValBackup"
:: Pobranie pliku konfiguracyjnego do folderu tymczasowego
set "temp_file_gameUserSettings=%TEMP%\GameUserSettings.ini"

:: Sprawdzenie, czy główny folder konfiguracyjny istnieje
if not exist "%config_folder%" (
    echo Folder konfiguracyjny Valoranta nie istnieje.
    pause
    exit /b
)

:: Utworzenie folderu ExodusValBackup, jeśli nie istnieje
if not exist "%backup_folder%" (
    echo Tworzenie folderu ExodusValBackup na Pulpicie...
    mkdir "%backup_folder%"
) else (
    echo Folder ExodusValBackup już istnieje.
)

:: Licznik skopiowanych plików
set "counter=0"

:: Przeszukiwanie wszystkich podfolderów i tworzenie kopii zapasowych plików konfiguracyjnych
echo Tworzenie kopii zapasowych plików konfiguracyjnych...
for /d %%d in ("%config_folder%\*") do (
    if exist "%%d\Windows\GameUserSettings.ini" (
        set "timestamp=%date:~-4%%date:~3,2%%date:~0,2%_%time:~0,2%%time:~3,2%%time:~6,2%"
        set "timestamp=%timestamp: =0%"
        copy "%%d\Windows\GameUserSettings.ini" "%backup_folder%\GameUserSettings_%%~nd_%timestamp%.ini" >nul
        set /a counter+=1
    )
)

cls 

:VIGS

set "url=https://github.com/MusztiDev/Exodus/releases/download/exodus/GameUserSettings.ini"
:: Ustawienie ścieżki do głównego folderu konfiguracyjnego Valoranta
set "config_folder=%USERPROFILE%\AppData\Local\Valorant\Saved\Config"
:: Ustawienie ścieżki do folderu Backup na Pulpicie
set "backup_folder=%USERPROFILE%\Desktop\ExodusValBackup"
:: Pobranie pliku konfiguracyjnego do folderu tymczasowego
set "temp_file_gameUserSettings=%TEMP%\GameUserSettings.ini"
cls


echo.
echo.
echo             ::::::::::       :::    :::        ::::::::        :::::::::        :::    :::        ::::::::  
echo             :+:              :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+: 
echo             +:+               +:+  +:+        +:+    +:+       +:+    +:+       +:+    +:+       +:+        
echo             +#++:++#           +#++:+         +#+    +:+       +#+    +:+       +#+    +:+       +#++:++#++ 
echo             +#+               +#+  +#+        +#+    +#+       +#+    +#+       +#+    +#+               +#+ 
echo             #+#              #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+# 
echo             ##########       ###    ###        ########        #########         ########         ########     
echo.
echo ________________________________________________________________________________________________________________________  
echo                                                   Valorant Optimizer
echo ________________________________________________________________________________________________________________________ 
echo.
echo.
echo.
echo.
echo                                        Downloading Optimized Settings...
echo.
echo                                                      Progress
echo                                              [----------          ] 50%%

timeout /t 1 >nul 2>&1

powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%temp_file_gameUserSettings%'"

:: Sprawdzenie, czy plik został pobrany pomyślnie
if not exist "%temp_file_gameUserSettings%" (
    echo Nie udało się pobrać pliku konfiguracyjnego.
    pause
    exit /b
)

:: Kopiowanie nowego pliku konfiguracyjnego do wszystkich folderów Windows
cls
echo.
echo.
echo             ::::::::::       :::    :::        ::::::::        :::::::::        :::    :::        ::::::::  
echo             :+:              :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+: 
echo             +:+               +:+  +:+        +:+    +:+       +:+    +:+       +:+    +:+       +:+        
echo             +#++:++#           +#++:+         +#+    +:+       +#+    +:+       +#+    +:+       +#++:++#++ 
echo             +#+               +#+  +#+        +#+    +#+       +#+    +#+       +#+    +#+               +#+ 
echo             #+#              #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+# 
echo             ##########       ###    ###        ########        #########         ########         ########     
echo.
echo ________________________________________________________________________________________________________________________  
echo                                                   Valorant Optimizer
echo ________________________________________________________________________________________________________________________ 
echo.
echo.
echo.
echo.
echo                                        Applying Settings to all of the accounts...
echo.
echo                                                      Progress
echo                                              [--------------------] 100%%

timeout /t 1 >nul 2>&1


:: Usunięcie pliku tymczasowego
del "%temp_file_gameUserSettings%"

:: Wyświetlenie liczby skopiowanych plików
cls 
echo.
echo.
echo             ::::::::::       :::    :::        ::::::::        :::::::::        :::    :::        ::::::::  
echo             :+:              :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+: 
echo             +:+               +:+  +:+        +:+    +:+       +:+    +:+       +:+    +:+       +:+        
echo             +#++:++#           +#++:+         +#+    +:+       +#+    +:+       +#+    +:+       +#++:++#++ 
echo             +#+               +#+  +#+        +#+    +#+       +#+    +#+       +#+    +#+               +#+ 
echo             #+#              #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+# 
echo             ##########       ###    ###        ########        #########         ########         ########     
echo.
echo ________________________________________________________________________________________________________________________  
echo                                                   Valorant Optimizer
echo ________________________________________________________________________________________________________________________ 
echo Successfully changed in-game graphics settings.
echo.
echo.
echo.
echo.
echo                                           Press any key to go back to the menu.
pause > nul
cls
goto menu








:VNS

cls 
echo.
echo             ::::::::::       :::    :::        ::::::::        :::::::::        :::    :::        ::::::::  
echo             :+:              :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+: 
echo             +:+               +:+  +:+        +:+    +:+       +:+    +:+       +:+    +:+       +:+        
echo             +#++:++#           +#++:+         +#+    +:+       +#+    +:+       +#+    +:+       +#++:++#++ 
echo             +#+               +#+  +#+        +#+    +#+       +#+    +#+       +#+    +#+               +#+ 
echo             #+#              #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+# 
echo             ##########       ###    ###        ########        #########         ########         ########     
echo.
echo ________________________________________________________________________________________________________________________  
echo                                                   Valorant Optimizer
echo ________________________________________________________________________________________________________________________ 


set "INSPECTOR_ZIP_URL=https://github.com/Orbmu2k/nvidiaProfileInspector/releases/download/2.4.0.4/nvidiaProfileInspector.zip"
set "INSPECTOR_ZIP_PATH=C:\nvidiaProfileInspector.zip"
set "INSPECTOR_EXTRACT_PATH=C:\nvidiaProfileInspector"

set "PROFILE_URL_REBAR_OFF=https://github.com/5Noxi/Fortnite-Settings/releases/download/NoverseNPI-OffReBarOFF/Noverse-ReBar-OFF.nip"
set "PROFILE_URL_REBAR_ON=https://github.com/5Noxi/Fortnite-Settings/releases/download/NoverseNPI-OffReBarON/Noverse-ReBar-ON.nip"

set "PROFILE_PATH=C:\Noverse_Profile.nip"

echo Select a profile to import:
echo.
echo  [1] ReBar OFF (< rtx3060)
echo  [2] ReBar ON  (> rtx3060)
echo.
set /p USER_CHOICE="Enter your choice: "

if "%USER_CHOICE%"=="1" (
    set "PROFILE_URL=!PROFILE_URL_REBAR_OFF!"
) else if "%USER_CHOICE%"=="2" (
    set "PROFILE_URL=!PROFILE_URL_REBAR_ON!"
) else (
    echo Invalid choice. Exiting...
    goto EndScript
)

cls
echo.
echo.
echo             ::::::::::       :::    :::        ::::::::        :::::::::        :::    :::        ::::::::  
echo             :+:              :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+: 
echo             +:+               +:+  +:+        +:+    +:+       +:+    +:+       +:+    +:+       +:+        
echo             +#++:++#           +#++:+         +#+    +:+       +#+    +:+       +#+    +:+       +#++:++#++ 
echo             +#+               +#+  +#+        +#+    +#+       +#+    +#+       +#+    +#+               +#+ 
echo             #+#              #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+# 
echo             ##########       ###    ###        ########        #########         ########         ########     
echo.
echo ________________________________________________________________________________________________________________________  
echo                                                   Valorant Optimizer
echo ________________________________________________________________________________________________________________________ 
echo.
echo.
echo.
echo.
echo                                         Starting with the import process... 
echo.
echo                                                      Progress
echo                                              [                    ] 0%%


timeout /t 2 >nul 2>&1


cls
echo.
echo.
echo             ::::::::::       :::    :::        ::::::::        :::::::::        :::    :::        ::::::::  
echo             :+:              :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+: 
echo             +:+               +:+  +:+        +:+    +:+       +:+    +:+       +:+    +:+       +:+        
echo             +#++:++#           +#++:+         +#+    +:+       +#+    +:+       +#+    +:+       +#++:++#++ 
echo             +#+               +#+  +#+        +#+    +#+       +#+    +#+       +#+    +#+               +#+ 
echo             #+#              #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+# 
echo             ##########       ###    ###        ########        #########         ########         ########     
echo.
echo ________________________________________________________________________________________________________________________  
echo                                                   Valorant Optimizer
echo ________________________________________________________________________________________________________________________ 
echo.
echo.
echo.
echo.
echo                                       Downloading NVIDIA Profile Inspector...
echo.
echo                                                      Progress
echo                                              [-----               ] 25%%




powershell -Command "Invoke-WebRequest -Uri !INSPECTOR_ZIP_URL! -OutFile !INSPECTOR_ZIP_PATH!"

timeout /t 1 >nul 2>&1




cls
echo.
echo.
echo             ::::::::::       :::    :::        ::::::::        :::::::::        :::    :::        ::::::::  
echo             :+:              :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+: 
echo             +:+               +:+  +:+        +:+    +:+       +:+    +:+       +:+    +:+       +:+        
echo             +#++:++#           +#++:+         +#+    +:+       +#+    +:+       +#+    +:+       +#++:++#++ 
echo             +#+               +#+  +#+        +#+    +#+       +#+    +#+       +#+    +#+               +#+ 
echo             #+#              #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+# 
echo             ##########       ###    ###        ########        #########         ########         ########     
echo.
echo ________________________________________________________________________________________________________________________  
echo                                                   Valorant Optimizer
echo ________________________________________________________________________________________________________________________ 
echo.
echo.
echo.
echo.
echo                                        Extracting NVIDIA Profile Inspector...
echo.
echo                                                      Progress
echo                                              [----------          ] 50%



powershell -Command "Expand-Archive -Path !INSPECTOR_ZIP_PATH! -DestinationPath !INSPECTOR_EXTRACT_PATH!"
del /f /q "!INSPECTOR_ZIP_PATH!"

timeout /t 1 >nul 2>&1


cls
echo.
echo.
echo             ::::::::::       :::    :::        ::::::::        :::::::::        :::    :::        ::::::::  
echo             :+:              :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+: 
echo             +:+               +:+  +:+        +:+    +:+       +:+    +:+       +:+    +:+       +:+        
echo             +#++:++#           +#++:+         +#+    +:+       +#+    +:+       +#+    +:+       +#++:++#++ 
echo             +#+               +#+  +#+        +#+    +#+       +#+    +#+       +#+    +#+               +#+ 
echo             #+#              #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+# 
echo             ##########       ###    ###        ########        #########         ########         ########     
echo.
echo ________________________________________________________________________________________________________________________  
echo                                                   Valorant Optimizer
echo ________________________________________________________________________________________________________________________ 
echo.
echo.
echo.
echo.
echo                                         Downloading the selected profile...
echo.
echo                                                      Progress
echo                                              [---------------     ] 75%%


powershell -Command "Invoke-WebRequest -Uri !PROFILE_URL! -OutFile !PROFILE_PATH!"

timeout /t 1 >nul 2>&1


cls
echo.
echo.
echo             ::::::::::       :::    :::        ::::::::        :::::::::        :::    :::        ::::::::  
echo             :+:              :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+: 
echo             +:+               +:+  +:+        +:+    +:+       +:+    +:+       +:+    +:+       +:+        
echo             +#++:++#           +#++:+         +#+    +:+       +#+    +:+       +#+    +:+       +#++:++#++ 
echo             +#+               +#+  +#+        +#+    +#+       +#+    +#+       +#+    +#+               +#+ 
echo             #+#              #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+# 
echo             ##########       ###    ###        ########        #########         ########         ########     
echo.
echo ________________________________________________________________________________________________________________________  
echo                                                   Valorant Optimizer
echo ________________________________________________________________________________________________________________________ 
echo.
echo.
echo.
echo.
echo                                           Importing the selected profile...
echo.
echo                                                      Progress
echo                                              [--------------------] 100%%

"!INSPECTOR_EXTRACT_PATH!\nvidiaProfileInspector.exe" -importProfile "!PROFILE_PATH!" >nul 2>&1

timeout /t 1 >nul 2>&1



echo.
echo             ::::::::::       :::    :::        ::::::::        :::::::::        :::    :::        ::::::::  
echo             :+:              :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+: 
echo             +:+               +:+  +:+        +:+    +:+       +:+    +:+       +:+    +:+       +:+        
echo             +#++:++#           +#++:+         +#+    +:+       +#+    +:+       +#+    +:+       +#++:++#++ 
echo             +#+               +#+  +#+        +#+    +#+       +#+    +#+       +#+    +#+               +#+ 
echo             #+#              #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+# 
echo             ##########       ###    ###        ########        #########         ########         ########     
echo.
echo ________________________________________________________________________________________________________________________  
echo                                                   Valorant Optimizer
echo ________________________________________________________________________________________________________________________ 
echo Successfully changed Nvidia control panel settings.
echo.
echo.
echo.
echo.
echo                                           Press any key to go back the  menu.
pause > nul
cls
goto menu
















:VQoS

cls 
echo.
echo             ::::::::::       :::    :::        ::::::::        :::::::::        :::    :::        ::::::::  
echo             :+:              :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+: 
echo             +:+               +:+  +:+        +:+    +:+       +:+    +:+       +:+    +:+       +:+        
echo             +#++:++#           +#++:+         +#+    +:+       +#+    +:+       +#+    +:+       +#++:++#++ 
echo             +#+               +#+  +#+        +#+    +#+       +#+    +#+       +#+    +#+               +#+ 
echo             #+#              #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+# 
echo             ##########       ###    ###        ########        #########         ########         ########     
echo.
echo ________________________________________________________________________________________________________________________  
echo                                                   Valorant Optimizer
echo ________________________________________________________________________________________________________________________ 
echo Searching for VALORANT-Win64-Shipping.exe...
echo.

for /f "delims=" %%i in ('powershell -command "Get-ChildItem -Path C:\ -Filter VALORANT-Win64-Shipping.exe -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1 -ExpandProperty FullName"') do set APPLICATION=%%i

if not defined APPLICATION (
    echo VALORANT-Win64-Shipping.exe not found.
    pause
    exit
)

echo Found at: %APPLICATION%
timeout /t 3 >nul 2>&1

cls
echo.
echo             ::::::::::       :::    :::        ::::::::        :::::::::        :::    :::        ::::::::  
echo             :+:              :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+: 
echo             +:+               +:+  +:+        +:+    +:+       +:+    +:+       +:+    +:+       +:+        
echo             +#++:++#           +#++:+         +#+    +:+       +#+    +:+       +#+    +:+       +#++:++#++ 
echo             +#+               +#+  +#+        +#+    +#+       +#+    +#+       +#+    +#+               +#+ 
echo             #+#              #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+# 
echo             ##########       ###    ###        ########        #########         ########         ########     
echo.
echo ________________________________________________________________________________________________________________________  
echo                                                   Valorant Optimizer
echo ________________________________________________________________________________________________________________________ 
echo.
echo.
echo.
echo.
echo                                        Modifying the QoS registry entries...
echo.
echo                                                      Progress
echo                                              [                    ] 0%%

timeout /t 1 >nul 2>&1

cls
echo.
echo             ::::::::::       :::    :::        ::::::::        :::::::::        :::    :::        ::::::::  
echo             :+:              :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+: 
echo             +:+               +:+  +:+        +:+    +:+       +:+    +:+       +:+    +:+       +:+        
echo             +#++:++#           +#++:+         +#+    +:+       +#+    +:+       +#+    +:+       +#++:++#++ 
echo             +#+               +#+  +#+        +#+    +#+       +#+    +#+       +#+    +#+               +#+ 
echo             #+#              #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+# 
echo             ##########       ###    ###        ########        #########         ########         ########     
echo.
echo ________________________________________________________________________________________________________________________  
echo                                                   Valorant Optimizer
echo ________________________________________________________________________________________________________________________ 
echo.
echo.
echo.
echo.
echo                                        Modifying the QoS registry entries...
echo.
echo                                                      Progress
echo                                              [-----               ] 25%%


Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\Valorant" /v "Version" /t REG_SZ /d "1.0" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\Valorant" /v "Application Name" /t REG_SZ /d "%APPLICATION%" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\Valorant" /v "Protocol" /t REG_SZ /d "*" /f > NUL 2>&1


timeout /t 1 >nul 2>&1

cls
echo.
echo             ::::::::::       :::    :::        ::::::::        :::::::::        :::    :::        ::::::::  
echo             :+:              :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+: 
echo             +:+               +:+  +:+        +:+    +:+       +:+    +:+       +:+    +:+       +:+        
echo             +#++:++#           +#++:+         +#+    +:+       +#+    +:+       +#+    +:+       +#++:++#++ 
echo             +#+               +#+  +#+        +#+    +#+       +#+    +#+       +#+    +#+               +#+ 
echo             #+#              #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+# 
echo             ##########       ###    ###        ########        #########         ########         ########     
echo.
echo ________________________________________________________________________________________________________________________  
echo                                                   Valorant Optimizer
echo ________________________________________________________________________________________________________________________ 
echo.
echo.
echo.
echo.
echo                                        Modifying the QoS registry entries...
echo.
echo                                                      Progress
echo                                              [----------          ] 50%%


Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\Valorant" /v "Local Port" /t REG_SZ /d "*" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\Valorant" /v "Local IP" /t REG_SZ /d "*" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\Valorant" /v "Local IP Prefix Length" /t REG_SZ /d "*" /f > NUL 2>&1

timeout /t 1 >nul 2>&1

cls
echo.
echo             ::::::::::       :::    :::        ::::::::        :::::::::        :::    :::        ::::::::  
echo             :+:              :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+: 
echo             +:+               +:+  +:+        +:+    +:+       +:+    +:+       +:+    +:+       +:+        
echo             +#++:++#           +#++:+         +#+    +:+       +#+    +:+       +#+    +:+       +#++:++#++ 
echo             +#+               +#+  +#+        +#+    +#+       +#+    +#+       +#+    +#+               +#+ 
echo             #+#              #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+# 
echo             ##########       ###    ###        ########        #########         ########         ########     
echo.
echo ________________________________________________________________________________________________________________________  
echo                                                   Valorant Optimizer
echo ________________________________________________________________________________________________________________________ 
echo.
echo.
echo.
echo                                 Modifying registry to disable maximized windowed mode...
echo.
echo                                                      Progress
echo                                              [---------------     ] 75%%


Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\Valorant" /v "Remote Port" /t REG_SZ /d "*" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\Valorant" /v "Remote IP" /t REG_SZ /d "*" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\Valorant" /v "Remote IP Prefix Length" /t REG_SZ /d "*" /f > NUL 2>&1

timeout /t 1 >nul 2>&1

cls
echo.
echo             ::::::::::       :::    :::        ::::::::        :::::::::        :::    :::        ::::::::  
echo             :+:              :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+: 
echo             +:+               +:+  +:+        +:+    +:+       +:+    +:+       +:+    +:+       +:+        
echo             +#++:++#           +#++:+         +#+    +:+       +#+    +:+       +#+    +:+       +#++:++#++ 
echo             +#+               +#+  +#+        +#+    +#+       +#+    +#+       +#+    +#+               +#+ 
echo             #+#              #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+# 
echo             ##########       ###    ###        ########        #########         ########         ########     
echo.
echo ________________________________________________________________________________________________________________________  
echo                                                   Valorant Optimizer
echo ________________________________________________________________________________________________________________________ 
echo.
echo.
echo.
echo.
echo                                 Modifying registry to disable maximized windowed mode...
echo.
echo                                                      Progress
echo                                              [--------------------] 100%%


Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\Valorant" /v "DSCP Value" /t REG_SZ /d "46" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\Valorant" /v "Throttle Rate" /t REG_SZ /d "-1" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%APPLICATION%" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE HIGHDPIAWARE" /f > NUL 2>&1



cls
echo.
echo.
echo             ::::::::::       :::    :::        ::::::::        :::::::::        :::    :::        ::::::::  
echo             :+:              :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+: 
echo             +:+               +:+  +:+        +:+    +:+       +:+    +:+       +:+    +:+       +:+        
echo             +#++:++#           +#++:+         +#+    +:+       +#+    +:+       +#+    +:+       +#++:++#++ 
echo             +#+               +#+  +#+        +#+    +#+       +#+    +#+       +#+    +#+               +#+ 
echo             #+#              #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+# 
echo             ##########       ###    ###        ########        #########         ########         ########     
echo.
echo ________________________________________________________________________________________________________________________  
echo                                                   Valorant Optimizer
echo ________________________________________________________________________________________________________________________ 
echo                  Valorant has been configured with QoS settings and exclusive fullscreen enabled.
echo.
echo.
echo.
echo.
echo.
echo                                      Press any key to go back the  menu.
pause > nul 
cls
goto menu






:HIP


cls
echo.
echo             ::::::::::       :::    :::        ::::::::        :::::::::        :::    :::        ::::::::  
echo             :+:              :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+: 
echo             +:+               +:+  +:+        +:+    +:+       +:+    +:+       +:+    +:+       +:+        
echo             +#++:++#           +#++:+         +#+    +:+       +#+    +:+       +#+    +:+       +#++:++#++ 
echo             +#+               +#+  +#+        +#+    +#+       +#+    +#+       +#+    +#+               +#+ 
echo             #+#              #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+# 
echo             ##########       ###    ###        ########        #########         ########         ########     
echo.
echo ________________________________________________________________________________________________________________________  
echo                                                   Valorant Optimizer
echo ________________________________________________________________________________________________________________________ 
echo Setting high priority for VALORANT-Win64-Shipping.exe through registry...
echo.

timeout /t 1 >nul 2>&1

:: Dodanie wpisu rejestru ustawiającego wysoki priorytet dla VALORANT-Win64-Shipping.exe
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\VALORANT-Win64-Shipping.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 3 /f

cls
echo.
echo.
echo             ::::::::::       :::    :::        ::::::::        :::::::::        :::    :::        ::::::::  
echo             :+:              :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+:       :+:    :+: 
echo             +:+               +:+  +:+        +:+    +:+       +:+    +:+       +:+    +:+       +:+        
echo             +#++:++#           +#++:+         +#+    +:+       +#+    +:+       +#+    +:+       +#++:++#++ 
echo             +#+               +#+  +#+        +#+    +#+       +#+    +#+       +#+    +#+               +#+ 
echo             #+#              #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+#       #+#    #+# 
echo             ##########       ###    ###        ########        #########         ########         ########     
echo.
echo ________________________________________________________________________________________________________________________  
echo                                                   Valorant Optimizer
echo ________________________________________________________________________________________________________________________ 
echo Successfully set high priority for VALORANT.
echo.
echo.
echo.
echo.
echo.
echo                                      Press any key to go back the  menu.
pause > nul 
cls
goto menu








