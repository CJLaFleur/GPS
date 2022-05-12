$packageName = 'chrome'
$fileType = 'msi'
$fileLocation = "http://10.0.13.55/chrome/GoogleChromeStandaloneEnterprise64.msi"
$silentArgs = '/qn'

Install-ChocolateyPackage $packageName $fileType $silentArgs $fileLocation
