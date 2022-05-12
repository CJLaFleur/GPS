$packageName = 'fssavast'
$fileType = 'msi'
$fileLocation = "\\ghs-nas01\it$\_Choco\fss\fssavast\avast_business_agent_setup_offline_FSS-PC_20-7.msi"
$silentArgs = '/qn /norestart'

Install-ChocolateyPackage $packageName $fileType $silentArgs $fileLocation
