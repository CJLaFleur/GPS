$packageName = 'cenavast'
$fileType = 'msi'
$fileLocation = "\\ghs-nas01\it$\_Choco\cen\cenavast\avast_business_agent_setup_offline_STD_CEN-PC_21-11.msi"
$silentArgs = '/qn /norestart'

Install-ChocolateyPackage $packageName $fileType $silentArgs $fileLocation
