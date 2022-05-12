$packageName = 'fcsfaronicscore'
$fileType = 'msi'
$fileLocation = "\\ghs-nas01\it$\_Choco\fcs\fcsfaronics\FCS Faronics Core Agent.msi"
$silentArgs = '/qn /norestart'

Install-ChocolateyPackage $packageName $fileType $silentArgs $fileLocation
