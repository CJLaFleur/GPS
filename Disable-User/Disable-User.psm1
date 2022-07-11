function Disable-User {


 [CmdletBinding()]
  param(

    [Parameter(Mandatory = $True,
      Position = 0,
      HelpMessage = "Specify the users you want to disable.")]
    [String[]]$Users

  )



  foreach ($U in $Users) {

    $UserDN  = (Get-ADUser -Identity $U).distinguishedName
    $UserDNStr = $UserDN.ToString()
    $Site = ($UserDNStr -split ",")[4].substring(3)
    $GHSStaffOU = "OU=Disabled Staff Accounts,OU=Staff,OU=Users,OU=" + "$Site" + ",OU=District Sites,OU=GPSK12_TREE,DC=GPSK12,DC=local"
    $StudentOU = "OU=Disabled,OU=Students,OU=Users,OU=" + "$Site" + ",OU=District Sites,OU=GPSK12_TREE,DC=GPSK12,DC=local"
    $GMSStudentOU = "OU=Disabled - Left District,OU=Students,OU=Users,OU=" + "$Site" + ",OU=District Sites,OU=GPSK12_TREE,DC=GPSK12,DC=local"
    $GHSStaffOU = "OU=Disabled Staff Accounts,OU=Staff,OU=Users,OU=" + "$Site" + ",OU=District Sites,OU=GPSK12_TREE,DC=GPSK12,DC=local"
    $NPSStaffOU = "OU=Disabled Accounts,OU=Staff,OU=Users,OU=" + "$Site" + ",OU=District Sites,OU=GPSK12_TREE,DC=GPSK12,DC=local"
    
    
    
    if ($UserDNStr -match "Student" -and $Site -match "GMS") {

        Move-ADObject -Identity $UserDN -TargetPath $GMSStudentOU

    }
    
    elseif ($UserDNStr -match "Staff" -and $UserDNStr -match "GHS") {

        Move-ADObject -Identity $UserDN -TargetPath $GHSStaffOU

    }
    
    elseif ($UserDNStr -match "Staff" -and $Site -match "NPS") {

        Move-ADObject -Identity $UserDN -TargetPath $NPSStaffOU

    }
    
    elseif ($UserDNStr -match "Student") {

        Move-ADObject -Identity $UserDN -TargetPath $StudentOU

    }
    
    elseif ($UserDNStr -match "Staff") {

        Move-ADObject -Identity $UserDN -TargetPath $StaffOU

    }
    
    else {
    
     Write-Host "Error"

     }

     Set-ADUser -Identity $UserDN -Enabled $False
  }

}