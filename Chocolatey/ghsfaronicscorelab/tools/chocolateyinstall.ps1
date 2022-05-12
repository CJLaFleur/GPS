$packageName = 'ghsfaronicscorelab'
$fileType = 'msi'
$fileLocation = "\\ghs-nas01\it$\_Choco\ghs\ghsfaronics\Faronics Core Agent 4.11-2VM for LAB.msi"
$silentArgs = '/qn /norestart'

Install-ChocolateyPackage $packageName $fileType $silentArgs $fileLocation
