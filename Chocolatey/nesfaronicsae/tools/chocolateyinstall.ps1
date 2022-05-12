$packageName = 'nesfaronicsae'
$fileType = 'msi'
$fileLocation = "\\ghs-nas01\it$\_Choco\nes\nesfaronics\AEEnt_64-bit_en.msi"
$silentArgs = '/qn /norestart'

Install-ChocolateyPackage $packageName $fileType $silentArgs $fileLocation