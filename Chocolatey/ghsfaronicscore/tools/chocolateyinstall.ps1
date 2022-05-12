$packageName = 'ghsfaronicscore'
$fileType = 'msi'
$fileLocation = "\\ghs-nas01\it$\_Choco\ghs\ghsfaronics\Faronics Core Agent 4.11-1VM for DSK.msi"
$silentArgs = '/qn /norestart'

Install-ChocolateyPackage $packageName $fileType $silentArgs $fileLocation
