$packageName = 'ghsavast'
$fileType = 'msi'
$fileLocation = "\\ghs-nas01\it$\_Choco\ghs\ghsavast\avast_business_agent_setup_offline_STD_GHS-PC_21-2.msi"
$silentArgs = '/qn'

Install-ChocolateyPackage $packageName $fileType $silentArgs $fileLocation
