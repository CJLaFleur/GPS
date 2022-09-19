Function Create-User {

 [CmdletBinding()]
  param(

    [Parameter(Mandatory = $False,
      Position = 0,
      HelpMessage = "Specify the users you want to create.")]
    [String[]]$Users,

    [Parameter(Mandatory = $False,
      Position = 1,
      HelpMessage = "Specify the year of the user's graduation (use 1 for staff).")]
    [String[]]$Year,

    [Parameter(Mandatory = $False,
    Position = 2,
      HelpMessage = "Specify the primary site for the users.")]
      [String[]]$Site,

    [Parameter(Mandatory = $False,
      HelpMessage = "Specify the primary site for the users.")]
      [Alias('Input', 'In', 'if')]
      $InputFile

  )

  $UserObj | Out-Null

  for ($i = 0; $i -lt $Users.Count; $i++) {

  $F3 = ($Users[$i]).substring(0,3)
  $L3 = ($Users[$i] -split " ")[1].substring(0,3)
  $FName = ($Users[$i] -split " ")[0]
  $LName = ($Users[$i] -split " ")[1]
  $F3 = $F3.ToUpper()
  $L3 = $L3.ToUpper()
  $UserType | Out-Null
  $Username = "$F3" + "$L3" + "$Year"
  $HomeDir | Out-Null
  $Template | Out-Null
  $Groups | Out-Null
  $Password = ConvertTo-SecureString 'abcd1234' -AsPlainText -Force

  if ($Year[$i] -eq "1") {

    $Building = $Site[$i]
    $UserType = "Staff"
    $HomeDir = "\\" + "$Building" + "-DC01\MyHome$\_STAFF\" + "$Username"
    $Temp = "$Site" + "STA1"
    $Template = Get-ADUser -Identity $Temp -Properties MemberOf
    $Groups = $Template.MemberOf

  }

  else {

    $Building = $Site[$i]
    $Y = $Year[$i]
    $UserType = "Student"
    $HomeDir = "\\" + "$Site[$i]" + "-DC01\MyHome$\_STUDENTS\" + "$Year" + "\" + "$Username"
    $Temp = "$Site" + "STU" + "$Y"
    $Template = Get-ADUser -Identity $Temp -Properties MemberOf
    $Groups = $Template.MemberOf

  }

  $UserObj = [PSCustomObject]@{

        Username = $Username
        UPN = $Username + "@GPSK12.local"
        FirstName = $FName
        LastName = $LName
        Site = $Site[$i]
        UserType = $UserType
        Year = $Year[$i]
        HomeDirectory = $HomeDir
        Groups = $Groups
        OU = $OU
        Password = $Password

  }


    }

    Function Add-EditUser ($UserObj) {

          New-ADUser -Name $UserObj.Username -UserPrincipalName $UserObj.UPN -AccountPassword $UserObj.Password -ChangePasswordAtLogon $True -DisplayName $UserObj.Username -HomeDirectory $UserObj.HomeDirectory -GivenName $UserObj.FirstName -Surname $UserObj.LastName -SamAccountName $UserObj.Username -HomeDrive H: -Enabled $True
          $UserInstance = Get-ADUser $UserObj.UPN -Verbose
          Add-ADGroupMember -Identity $UserInstance -Members $UserObj.Groups

    }
    Add-EditUser($UserObj)
}
