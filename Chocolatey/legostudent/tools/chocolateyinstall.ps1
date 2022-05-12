$packageName = 'legostudent'
$fileType = 'exe'
$silentArgs = 'spec.txt /q /acceptlicenses yes /r:n'
$fileFullPath = "C:\Users\gpsadmin\Documents\legoinst\lego.zip"
$url = "\\ghs-nas01\it$\_Choco\lego.zip"
$destination = "C:\Users\gpsadmin\Documents\legoinst"
$file64 = "C:\Users\gpsadmin\Documents\legoinst\setup.exe"


#Install-ChocolateyPackage $packageName $fileType $silentArgs $url64bit 
get-chocolateywebfile -packagename $packageName -filefullpath $fileFullPath -Url $url
Get-ChocolateyUnzip -filefullpath $fileFullPath -destination $destination
Install-ChocolateyInstallPackage -packagename $packageName -UseOnlyPackageSilentArguments -silentArgs $silentArgs -file64 $file64 -filetype $fileType
rm -r -fo $destination
rm -r -fo $fileFullPath