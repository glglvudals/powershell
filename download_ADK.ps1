Invoke-WebRequest -Uri https://go.microsoft.com/fwlink/?linkid=2120254 -OutFile "$env:USERPROFILE\Downloads\ADK.exe"
# win 11: https://go.microsoft.com/fwlink/?linkid=2165884
# win2022: https://go.microsoft.com/fwlink/?linkid=2162950
# win10_ver2004: https://go.microsoft.com/fwlink/?linkid=2120254
# win10_ver1903 : https://go.microsoft.com/fwlink/?linkid=2026036
# win10_ver1809 : https://go.microsoft.com/fwlink/?linkid=2026036
# winver : commandline for window version

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Kits\Installation" /v AcceptEula /t REG_DWORD /d 1 /f
OptionID.DeploymentTools
# Install ADK
Start-Process -FilePath C:\Users\kh\Downloads\ADK.exe -ArgumentList "/quiet /norestart /features OptionID.DeploymentTools" -Wait
Copy-Item -Path "D:\bootmgr" -Destination "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\WSIM"
Start-Process C:\Windows\System32\Robocopy.exe -ArgumentList "D:\sources\ C:\gogo /MIR /DCOPY:DAT /COPYALL /R:20 /W:15 /LOG:\log.txt"

robocopy “c:\aa” ” c:\bb ” /S /E /COPY:DAT /PURGE /MIR /DCOPY:DAT /R:1 /W:1 /NS /NFL /NDL /NP /LOG:”C:\RESULT.LOG
