#vCenter 접속
$vCenteruserID = Read-Host ("Enter vCenter User ID: ")
$vCenteruserPASSWD = Read-Host ("Enter vCenter User Password: ") -AsSecureString
Connect-VIServer -Server 172.16.11.20 -user $vCenteruserID -Password $vCenteruserPASSWD

# 기본 VM 종료
do {
    $write_VMs = Get-VM | Where-Object {$_.name -notlike "*nsx*" -and $_.Name -notlike "*nas*" -and $_.Name -notlike "ps-ad01" -and $_.Name -notlike "ps-vc01" -and $_.Name -notlike "edge" -and $_.Name -notlike "*vCLS*"}
    $write_VMs | Stop-VMGuest -Confirm:$false -ErrorAction SilentlyContinue
    Write-Host "Wait for VMs to be PoweredOff..."    
    Start-Sleep -Seconds 5
} until (
    $write_VMs.PowerState -eq "PoweredOff"
)
Write-Host "##### ALL VM is powered off #####"
# nas 종료
$powerstate_NAS = Get-VM | Where-Object {$_.Name -like "*nas*"}
if ($write_VMs.PowerState -eq "PoweredOff") {
    $powerstate_NAS | Stop-VMGuest -Confirm:$false -ErrorAction SilentlyContinue
}
do {
    $powerstate_NAS = Get-VM | Where-Object {$_.Name -like "*nas*"}
    Write-Host "Wait for NAS to be PoweredOff"
    Start-Sleep -Seconds 5
} until (
    $powerstate_NAS.PowerState -eq "PoweredOff"
)
Write-Host "##### NAS is powered off #####"
# nsx 종료
$powerstate_NSX = Get-VM | Where-Object {$_.Name -like "*nsx*"}
if ($powerstate_NAS.PowerState -eq "PoweredOff") {
    $powerstate_NSX | Stop-VMGuest -Confirm:$false -ErrorAction SilentlyContinue
}
do {
    $powerstate_NSX = Get-VM | Where-Object {$_.Name -like "*nsx*"}
    Write-Host "Wait for NSX to be PoweredOff"
    Start-Sleep -Seconds 5
} until (
    $powerstate_NSX.PowerState -eq "PoweredOff"
)
Write-Host "##### NSX is powered off #####"
# eage 종료
$powerstate_EDGE = Get-VM | Where-Object {$_.Name -like "edge"}
if ($powerstate_NSX.PowerState -eq "poweredoff ") {
    $powerstate_EDGE | Stop-VMGuest -Confirm:$false -ErrorAction SilentlyContinue
}
do {
    $powerstate_EDGE = Get-VM | Where-Object {$_.Name -like "edge"}
    Write-Host "Wait for EAGE to be PoweredOff"
    Start-Sleep -Seconds 5
} until (
    $powerstate_EDGE.PowerState -eq "PoweredOff"
)
Write-Host "##### EAGE is powered off #####"

# AD 종료
$powerstate_AD = Get-VM | Where-Object {$_.Name -like "*ad01"}
if ($powerstate_EDGE.PowerState -eq "PoweredOff") {
    $powerstate_AD | Stop-VMGuest -Confirm:$false -ErrorAction SilentlyContinue
}
do {
    $powerstate_AD = Get-VM | Where-Object {$_.Name -like "*ad01"}
    Write-Host "Wait for EAGE to be PoweredOff"
    Start-Sleep -Seconds 5
} until (
    $powerstate_AD.PowerState -eq "PoweredOff"
)
Write-Host "##### AD is powered off #####"

# host 종료
$VM_host = Get-VMHost | Where-Object {$_.name -notlike "*mgmt*"}
$VM_state = Get-VM | Where-Object {$_.name -notlike "*vc01" -and $_.Name -notlike "*vCLS*"}
if($VM_state.PowerState -eq "PoweredOff"){
    $VM_host | Stop-VMHost -Confirm:$false -ErrorAction SilentlyContinue
}
do { 
    $VM_host = Get-VMHost | Where-Object {$_.name -notlike "*mgmt*"}
    Write-Host "wait until host-1,2,3,4 is powered off..."
} until (
    $VM_host.PowerState -eq "PoweredOff"
)
Write-Host "##### HOST-1,2,3,4 is powered off #####"

$host_MGMT = Get-VMHost | Where-Object {$_.name -like "*mgmt*"}
if($VM_host.PowerState -eq "PoweredOff"){
    $host_MGMT | Stop-VMHost -Confirm:$false -ErrorAction SilentlyContinue
}
do {
    $VM_MGMT = Get-VMHost | Where-Object {$_.name -like "*mgmt*"}
    Write-Host "wait untile host-mgmt is powered off"
} until (
    $VM_MGMT.PowerState -eq "PoweredOff"
)
Write-Host "##### All host is powered off ######"