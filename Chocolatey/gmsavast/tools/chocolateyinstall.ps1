$packageName = 'gmsavast'
$fileType = 'msi'
$fileLocation = "\\ghs-nas01\it$\_Choco\gms\gmsavast\avast_business_agent_setup_offline_STD_GMS-PC_21-1.msi"
$silentArgs = '/qn /norestart'

Install-ChocolateyPackage $packageName $fileType $silentArgs $fileLocation
