$packageName = 'ipevo'
$fileType = 'msi'
$fileLocation = "\\ghs-nas01\it$\_Choco\Presenter_win_6.8.1.1.msi"
$silentArgs = '/qn'

Install-ChocolateyPackage $packageName $fileType $silentArgs $fileLocation
