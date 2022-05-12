function Clean-Profiles {
        
    [Cmdletbinding()]
    param(
    [Parameter(Mandatory=$True,
        Position = 0,
        ValueFromPipelineByPropertyName=$True,
        HelpMessage = "Enter the target computer name to be targeted. Can be multiple names.")]
        [Alias('Hostname','CN', 'ComputerName', 'Name')]
        [String[]]$CName
        )

   BEGIN {

   $Targets = New-Object System.Collections.Queue

   foreach ($CN in $CName) { 

        $HomeDir = "\\" + $CN + "\C$\Users\"

        $Profiles = dir $HomeDir

        foreach ($P in $Profiles) {
        
            if ( ($P -notlike "conlaf1") -and ($P -notlike "gpsadmin") -and ($P -notlike "Public") -and ($P -notlike "Default*") ) {
            
                $Targets.Enqueue(($HomeDir + $P + "\AppData\Local\Temp"))

                }          

            }

        }

   }

   PROCESS {

       function Delete-Data {


            1..$Targets.Count | Start-RSJob -VariablesToImport Targets -ScriptBlock {

            try {

            [io.directory]::delete(($Targets.Dequeue()), $true)

            }

            catch {

            }
            

            } -Throttle 50 | Wait-RSJob -ShowProgress | Receive-RSJob | Remove-RSJob | Out-Null

       } 

   }

   END {


       Delete-Data 
        

   }

}

Clean-Profiles