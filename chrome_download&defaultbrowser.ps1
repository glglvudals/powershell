Invoke-WebRequest -Uri "https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7B8A1035B0-3C0C-E957-17D9-ECBDFEBB564D%7D%26lang%3Dko%26browser%3D4%26usagestats%3D1%26appname%3DGoogle%2520Chrome%26needsadmin%3Dprefers%26ap%3Dx64-stable-statsdef_1%26installdataindex%3Dempty/update2/installers/ChromeSetup.exe" -OutFile "$env:USERPROFILE\Downloads\ChromeSetup.exe"
Start-Process -FilePath "$env:USERPROFILE\Downloads\ChromeSetup.exe"

# win2019
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice" /v "ProgId" /d "ChromeHTML" /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\.htm" /ve /d "ChromeHTML" /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\.html" /ve /d "ChromeHTML" /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\.shtml" /ve /d "ChromeHTML" /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\.xht" /ve /d "ChromeHTML" /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\.xhtml" /ve /d "ChromeHTML" /f

# win10
Start-Process "C:\Program Files\Google\Chrome\Application\chrome.exe" -Args --make-default-browser

