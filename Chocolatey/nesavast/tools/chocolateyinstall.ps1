$packageName = 'nesavast'
$fileType = 'msi'
$fileLocation = "\\ghs-nas01\it$\_Choco\nes\nesavast\avast_business_agent_setup_offline_NES-PC_20-5.msi"
$silentArgs = '/qn /norestart'

Install-ChocolateyPackage $packageName $fileType $silentArgs $fileLocation
