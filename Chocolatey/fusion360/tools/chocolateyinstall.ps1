$packageName = 'fusion360'
$fileType = 'exe'
$fileLocation = "\\ghs-nas01\it$\_Choco\Fusion 360 Admin Install.exe"
$silentArgs = '--quiet'

Install-ChocolateyPackage $packageName $fileType $silentArgs $fileLocation
