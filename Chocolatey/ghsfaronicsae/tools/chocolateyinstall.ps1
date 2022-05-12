$packageName = 'ghsfaronicsae'
$fileType = 'msi'
$fileLocation = "\\ghs-nas01\it$\_Choco\ghs\ghsfaronics\AEEnt_64-bit_en.msi"
$silentArgs = '/qn /norestart'

Install-ChocolateyPackage $packageName $fileType $silentArgs $fileLocation

#AEADMINPSW=wUl8+Wljdj TRUSTEDUSRPSW=wUl8+Wljdj