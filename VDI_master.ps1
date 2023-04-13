https://customerconnect.vmware.com/en/downloads/details?downloadGroup=VIEW-7130-STD&productId=1065&rPId=103022


https://learn.microsoft.com/ko-kr/troubleshoot/windows-client/deployment/sysprep-fails-remove-or-update-store-apps

Get-AppxProvisionedPackage -Online | Where {$_.DisplayName -NotMatch 'Microsoft.StorePurchaseApp' -and $_.DisplayName -NotMatch 'Microsoft.WindowsStore' -and $_.DisplayName -NotMatch 'Microsoft.MicrosoftEdge.Stable' -and $_.DisplayName -NotMatch 'Microsoft.WindowsCalculator' -and $_.DisplayName -NotMatch 'Microsoft.Windows.Photos' -and $_.DisplayName -NotMatch 'Microsoft.MSPaint' -and $_.DisplayName -NotMatch 'Microsoft.WindowsNotepad'} | Remove-AppxProvisionedPackage -Online -AllUsers

Get-ProvisionedAppPackage -Online | Remove-ProvisionedAppPackage -Online
Get-AppPackage | Remove-AppPackage

#앱 삭제
Powershell "& {Get-AppxProvisionedPackage -Online | Where {$_.DisplayName -NotMatch 'Microsoft.StorePurchaseApp' -and $_.DisplayName -NotMatch 'Microsoft.WindowsStore' -and $_.DisplayName -NotMatch 'Microsoft.MicrosoftEdge.Stable' -and $_.DisplayName -NotMatch 'Microsoft.WindowsCalculator' -and $_.DisplayName -NotMatch 'Microsoft.Windows.Photos' -and $_.DisplayName -NotMatch 'Microsoft.MSPaint' -and $_.DisplayName -NotMatch 'Microsoft.WindowsNotepad'} | Remove-AppxProvisionedPackage -Online -AllUsers}"
Powershell "& {Get-AppxPackage -AllUsers | Where-Object {$_.IsFramework -Match 'False' -and $_.NonRemovable -Match 'False' -and $_.Name -NotMatch 'Microsoft.StorePurchaseApp' -and $_.Name -NotMatch 'Microsoft.WindowsStore' -and $_.Name -NotMatch 'Microsoft.MicrosoftEdge.Stable' -and $_.Name -NotMatch 'Microsoft.WindowsCalculator' -and $_.Name -NotMatch 'Microsoft.Windows.Photos' -and $_.Name -NotMatch 'Microsoft.MSPaint' -and $_.Name -NotMatch 'Microsoft.WindowsNotepad'} | Remove-AppxPackage -AllUsers}"

cd C:\Windows\System32\Sysprep
sysprep.exe /generalize /oobe /reboot /quiet /unattend:C:\Unattend.xml