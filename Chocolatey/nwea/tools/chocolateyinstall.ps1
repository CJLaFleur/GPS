$packageName = 'nwea'
$fileType = 'msi'
$fileLocation = "\\ghs-nas01\it$\_Choco\nwea.msi"
$silentArgs = '/qn'

Install-ChocolateyPackage $packageName $fileType $silentArgs $fileLocation
