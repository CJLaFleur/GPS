$packageName = 'gmsfaronicscore'
$fileType = 'msi'
$fileLocation = "\\ghs-nas01\it$\_Choco\gms\gmsfaronics\Faronics Core Agent GMS.msi"
$silentArgs = '/qn /norestart'

Install-ChocolateyPackage $packageName $fileType $silentArgs $fileLocation
