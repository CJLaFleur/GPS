$packageName = 'adobeccgms'
$fileType = 'exe'
$url64bit = "\\ghs-nas01\it$\_Choco\gms\adobeccgms\adobeccgms.zip"
$silentArgs = '--silent'
$destination = "C:\Users\gpsadmin\Documents\adobeinst"
$filefullpath = "C:\Users\gpsadmin\Documents\adobeinst\adobeccgms.zip"
$file64 = "C:\Users\gpsadmin\Documents\adobeinst\GMS329\Build\setup.exe"

#Install-ChocolateyPackage $packageName $fileType $silentArgs $url64bit -UseOriginalLocation
get-chocolateywebfile -packagename $packagename -filefullpath $filefullpath -Url $url64bit
Get-ChocolateyUnzip -filefullpath $filefullpath -destination $destination
Install-ChocolateyInstallPackage -packagename $packagename -silentArgs $silentargs -file64 $file64 -filetype $filetype
rm -r -fo $destination
rm -r -fo $fileFullPath