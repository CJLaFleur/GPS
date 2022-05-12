$packageName = 'drc'
$fileType = 'msi'
$fileLocation = "\\ghs-nas01\it$\_Choco\drc_insight_setup.msi"
$silentArgs = '/qn'

Install-ChocolateyPackage $packageName $fileType $silentArgs $fileLocation
