$packageName = 'smart'
$fileType = 'msi'
$url64bit = "\\ghs-nas01\it$\_Choco\SmartNotebook18.1.zip"
$silentArgs = 'NB_PROD_KEY=NC-2ADSW-CNQB2-TBDQG-S4BSE-AAA ACTIVATE_LICENSE=1 /qn'
$destination = "C:\Users\gpsadmin\Documents\smartinst"
$filefullpath = "C:\Users\gpsadmin\Documents\smartinst\SmartNotebook18.1.zip"
$file64 = "C:\Users\gpsadmin\Documents\smartinst\Smart Notebook 18.1\SMARTLearningSuite.msi"

#Install-ChocolateyPackage $packageName $fileType $silentArgs $url64bit -UseOriginalLocation
get-chocolateywebfile -packagename $packagename -filefullpath $filefullpath -Url $url64bit
Get-ChocolateyUnzip -filefullpath $filefullpath -destination $destination
Install-ChocolateyInstallPackage -packagename $packagename -silentArgs $silentargs -file64 $file64 -filetype $filetype
rm -r -fo $destination
rm -r -fo $fileFullPath