$packageName = 'obsstudio'
$fileType = 'exe'
$fileLocation = "\\ghs-nas01\it$\_Choco\OBS-Studio-24.0.3-Full-Installer-x64.exe"
$silentArgs = '/S'

Install-ChocolateyPackage $packageName $fileType $silentArgs $fileLocation
