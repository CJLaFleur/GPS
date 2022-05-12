$packageName = 'scratch'
$fileType = 'msi'
$fileLocation = "\\ghs-nas01\it$\_Choco\Scratch2_MSI.msi"
$silentArgs = '/qn'

Install-ChocolateyPackage $packageName $fileType $silentArgs $fileLocation
