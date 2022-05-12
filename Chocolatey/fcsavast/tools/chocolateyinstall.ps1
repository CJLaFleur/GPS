$packageName = 'fcsavast'
$fileType = 'msi'
$fileLocation = "avast_business_agent_setup_offline_STD_FCS_21-1.msi"
$silentArgs = '/qn /norestart'

Install-ChocolateyPackage $packageName $fileType $silentArgs $fileLocation
