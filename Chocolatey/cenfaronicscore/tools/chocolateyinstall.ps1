$packageName = 'cenfaronicscore'
$fileType = 'msi'
$fileLocation = "\\ghs-nas01\it$\_Choco\cen\cenfaronics\Faronics Core Agent DAV.msi"
$silentArgs = '/qn /norestart'

Install-ChocolateyPackage $packageName $fileType $silentArgs $fileLocation
