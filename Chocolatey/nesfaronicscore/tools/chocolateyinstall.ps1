$packageName = 'nesfaronicscore'
$fileType = 'msi'
$fileLocation = "\\ghs-nas01\it$\_Choco\nes\nesfaronics\NES Faronics Core Agent.msi"
$silentArgs = '/qn /norestart'

Install-ChocolateyPackage $packageName $fileType $silentArgs $fileLocation
