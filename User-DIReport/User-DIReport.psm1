function User-DIReport {

    [CmdletBinding()]
  param(

    [Parameter(Mandatory = $False,
      Position = 0)]
    [String[]]$Users
    
    )

    BEGIN {

        $Schools = "GHS", "GMS", "FSS", "FCS", "NPS", "NES", "DAV", "IT Department"
        $UserList = New-Object System.Collections.Generic.List[System.Object]
        $Fail = New-Object System.Collections.Generic.List[System.Object]

        $OutPath = "\\dav-nas01\it$\GPS Dev\Reports\UserDIReport.csv"
        $FileHandle = New-Object System.IO.StreamWriter -Arg $OutPath
        $FileHandle.AutoFlush = $True

    }

    PROCESS {

    function Output-CSV ($Obj) {

        [String]$Username = $Obj.Username
        [String]$Reason = $Obj.FailReason
        [String]$OU = $Obj.OU

        $FileHandle.WriteLine("$Username,$Reason,$OU")

        }

    function Get-UserData {

        $Users = Get-ADUser -Filter * -Properties HomeDirectory | where {$_.Enabled -eq "True"} | select -Property DistinguishedName, HomeDirectory
    
        foreach ($U in $Users) {

            $UserObj = New-Object -TypeName PSObject

            $DN = ($U -split ";")[0]
            $Username = ($DN -split "=")[2]
            $Username = ($Username -split ",")[0]
            $Site = ($DN -split ",")[3]
            $Site = ($Site -split "=")[1]
            $HD = ($U -split ";")[1]
            $HomeDirectory = ($HD -split "=")[1].TrimEnd("}")
        
            $UserObj | Add-Member -Type NoteProperty -Name Username -Value $Username -Force
            $UserObj | Add-Member -Type NoteProperty -Name Site -Value $Site -Force
            $UserObj | Add-Member -Type NoteProperty -Name HomeDirectory -Value $HomeDirectory -Force

            $UserList.Add($UserObj)
        

            }
        }

    function Sort-UserData {
    
        for ($i = 0; $i -lt $UserList.Count; $i++) {

            $FailedObj = New-Object -TypeName PSObject
            
            try{

                $PathTest = Test-Path $UserList[$i].HomeDirectory

                if ($UserList[$i].HomeDirectory.Contains($UserList[$i].Site)) {}
                
                else {
                
                    if ($UserList[$i].Site -like "IT Department") {}

                    else {

                        $FailedObj | Add-Member -Type NoteProperty -Name Username -Value $UserList[$i].Username -Force
                        $FailedObj | Add-Member -Type NoteProperty -Name FailReason -Value "Home directory doesn't match" -Force
                        $FailedObj | Add-Member -Type NoteProperty -Name OU -Value $UserList[$i].Site -Force
                        
                        Output-CSV ($FailedObj)
                        $Fail.Add($FailedObj)

                        
                    }

                    }

                }

            catch {

                $FailedObj | Add-Member -Type NoteProperty -Name Username -Value $UserList[$i].Username -Force
                $FailedObj | Add-Member -Type NoteProperty -Name FailReason -Value "Null profile path" -Force

                Output-CSV ($FailedObj)
                $Fail.Add($FailedObj)
                
                } 
            
            if ($UserList[$i].Site.Length -NE 3 -and $UserList[$i].Site -ne "IT Department") {
            
                $FailedObj | Add-Member -Type NoteProperty -Name Username -Value $UserList[$i].Username -Force
                $FailedObj | Add-Member -Type NoteProperty -Name FailReason -Value "OU doesn't match" -Force
                $FailedObj | Add-Member -Type NoteProperty -Name OU -Value $UserList[$i].Site -Force

                Output-CSV ($FailedObj)
                $Fail.Add($FailedObj)
                
                }
            
            }
            
        }

    }

    END {
    
        Get-UserData
        
        Sort-UserData

        return $Fail | Format-Table | Out-String | ForEach-Object { $_.Trim() }
        $FileHandle.Flush()
        $FileHandle.Dispose()
        $FileHandle.Close()
        
    
    }
}