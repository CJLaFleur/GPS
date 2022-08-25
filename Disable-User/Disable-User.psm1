function Disable-User {


 [CmdletBinding()]
  param(

    [Parameter(Mandatory = $False,
      Position = 0,
      HelpMessage = "Specify the users you want to disable.")]
    [String[]]$Users,

    [Parameter(Mandatory = $False,
      HelpMessage = "Specify the primary site for the users.")]
      [Alias('Input', 'In', 'if')]
      $InputFile

  )


  if ($InputFile){

        $FileReader = New-Object System.IO.StreamReader -Arg $InputFile

        while ($FileReader.EndOfStream -EQ $False) {
            
            $Users += $FileReader.ReadLine()
            
            }
             
             $FileReader.Dispose()
             
             $FileReader.Close()
        }

    
    function Move-UserData($UserObj) {

    $DestinationDir
    $Username = $UserObj.Username.ToString()

        if ($UserObj.UserType -match "STU") {

            $DestinationDir = "\\" + "$Site" + "-DC01\MyHome$\_STUDENTS\_DisabledStudentData\" + "$Username"

        }
        
        else {

            $DestinationDir = "\\" + "$Site" + "-DC01\MyHome$\_STAFF\_DisabledStaffData\" + "$Username"

            }
            
        Move-Item -Path $UserObj.HomeDirectory -Destination $DestinationDir

    }
        
  foreach ($U in $Users) {

  

    $UserDN  = (Get-ADUser -Identity $U).distinguishedName
    $UserDNStr = $UserDN.ToString()
    $Username = $UserDNStr.Split(",")[0]
    $Username = $Username.Split("=")[1]
    $HomeDir = (Get-ADUser -Identity $U -Properties HomeDirectory).HomeDirectory
    $Site = $HomeDir.Substring(2,3)
    $UserType = $HomeDir.Substring(20,3)
    $GHSStaffOU = "OU=Disabled Staff Accounts,OU=Staff,OU=Users,OU=" + "$Site" + ",OU=District Sites,OU=GPSK12_TREE,DC=GPSK12,DC=local"
    $StudentOU = "OU=Disabled,OU=Students,OU=Users,OU=" + "$Site" + ",OU=District Sites,OU=GPSK12_TREE,DC=GPSK12,DC=local"
    $GMSStudentOU = "OU=Disabled - Left District,OU=Students,OU=Users,OU=" + "$Site" + ",OU=District Sites,OU=GPSK12_TREE,DC=GPSK12,DC=local"
    $NPSStaffOU = "OU=Disabled Accounts,OU=Staff,OU=Users,OU=" + "$Site" + ",OU=District Sites,OU=GPSK12_TREE,DC=GPSK12,DC=local"

    $UserObj = [PSCustomObject]@{

        UserDN = $UserDN
        Username = $Username
        Site = $Site
        HomeDirectory = $HomeDir
        UserType = $UserType
  
  }
    
    Set-ADUser -Identity $UserObj.UserDN -Enabled $False

    Move-UserData ($UserObj)
    
    if ($UserObj.UserType -match "STU" -and $UserObj.Site -match "GMS") {

        Move-ADObject -Identity $UserObj.UserDN -TargetPath $GMSStudentOU

    }
    
    elseif ($UserObj.UserType -match "STA" -and $UserObj.Site -match "GHS") {

        Move-ADObject -Identity $UserDN -TargetPath $GHSStaffOU

    }
    
    elseif ($UserObj.UserType -match "STA" -and $UserObj.Site -match "NPS") {

        Move-ADObject -Identity $UserDN -TargetPath $NPSStaffOU

    }
    
    elseif ($UserObj.UserDN -match "STU") {
        
        Move-ADObject -Identity $UserDN -TargetPath $StudentOU

    }
    
    elseif ($UserObj.UserDN -match "STA") {

        Move-ADObject -Identity $UserDN -TargetPath $StaffOU

    }
    
    else {
    
     Write-Host "Error"

     }
  }
}