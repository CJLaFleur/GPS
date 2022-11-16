function Computer-DIReport {

    [CmdletBinding()]
  param(
    [Parameter(Mandatory = $False,
      Position = 0)]
    [String[]]$Computers
    
    )

    BEGIN {

        $ComputerList = New-Object System.Collections.Generic.List[System.Object]

        $OutPath = "\\dav-nas01\it$\GPS Dev\Reports\ComputerDIReport.csv"
        $FileHandle = New-Object System.IO.StreamWriter -Arg $OutPath
        $FileHandle.AutoFlush = $True

    }

    PROCESS {

        function Output-CSV ($Obj) {

            [String]$ComputerName = $Obj.ComputerName
            [String]$LogonDate = $Obj.LogonDate

            $FileHandle.WriteLine("$ComputerName,$LogonDate")
        
        }

        function Get-ComputerData {

            $Computers = Search-ADAccount -ComputersOnly -AccountInactive -TimeSpan 90 | Select Name,LastLogonDate
        
            foreach ($C in $Computers) {

                $ComputerObj = New-Object -TypeName PSObject

                $CN = ($C -split ";")[0]
                $CN = ($CN -split "=")[1]
            
                $LogonDate = ($C -split ";")[1]
                $LogonDate = ($LogonDate -split "=")[1]
                $LogonDate = ($LogonDate -split " ")[0]
            
                $ComputerObj | Add-Member -Type NoteProperty -Name ComputerName -Value $CN -Force
                $ComputerObj | Add-Member -Type NoteProperty -Name LogonDate -Value $LogonDate -Force
                
                $ComputerList.Add($ComputerObj)
                Output-CSV($ComputerObj)

            }

        }
        
    }

    END {

        Get-ComputerData
        return $ComputerList | Format-Table | Out-String | ForEach-Object { $_.Trim() }
    
    }
}