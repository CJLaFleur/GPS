$packageName = 'fcsfaronicscore'
$fileType = 'msi'
$fileLocation = "\\ghs-nas01\it$\_Choco\fss\fssfaronics\FSS Faronics Core Agent 4.11.msi"
$silentArgs = '/qn /norestart'

Install-ChocolateyPackage $packageName $fileType $silentArgs $fileLocation
