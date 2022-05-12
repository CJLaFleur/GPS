$packageName = 'drc'
$fileType = 'msi'
$fileLocation = "\\ghs-nas01\it$\_Choco\testnav-1.8.2.msi"
$silentArgs = '/qn'

Install-ChocolateyPackage $packageName $fileType $silentArgs $fileLocation
