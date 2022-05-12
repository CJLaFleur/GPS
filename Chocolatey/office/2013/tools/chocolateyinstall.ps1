$packageName = 'office2013'
$fileType = 'exe'
$url64bit = "\\ghs-nas01\it$\_Choco\Office2013.zip"
$silentArgs = '/config "C:\Users\gpsadmin\Documents\officeinst\Office 2013 Install files\Config.xml"'
$fileFullPath = "C:\Users\gpsadmin\Documents\officeinst\office2013.zip"
$destination = "C:\Users\gpsadmin\Documents\officeinst"
$file64 = "C:\Users\gpsadmin\Documents\officeinst\Office 2013 Install files\setup.exe"

get-chocolateywebfile -packagename $packageName -filefullpath $fileFullPath -Url $url64bit
Get-ChocolateyUnzip -filefullpath $fileFullPath -destination $destination
Install-ChocolateyInstallPackage -packagename $packageName -UseOnlyPackageSilentArguments -silentArgs $silentArgs -file64 $file64 -filetype $fileType
rm -r -fo $destination
rm -r -fo $fileFullPath