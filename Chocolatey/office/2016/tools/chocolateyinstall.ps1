$packageName = 'office2016'
$fileType = 'exe'
$url64bit = "\\ghs-nas01\it$\_Choco\office2016.zip"
$silentArgs = '/config "C:\Users\gpsadmin\Documents\officeinst\Office 2016 Install Files\Config.xml"'
$fileFullPath = "C:\Users\gpsadmin\Documents\officeinst\office2016.zip"
$destination = "C:\Users\gpsadmin\Documents\officeinst"
$file64 = "C:\Users\gpsadmin\Documents\officeinst\Office 2016 Install Files\setup.exe"

get-chocolateywebfile -packagename $packageName -filefullpath $fileFullPath -Url $url64bit
Get-ChocolateyUnzip -filefullpath $fileFullPath -destination $destination
Install-ChocolateyInstallPackage -packagename $packageName -UseOnlyPackageSilentArguments -silentArgs $silentArgs -file64 $file64 -filetype $fileType
rm -r -fo $destination
rm -r -fo $fileFullPath