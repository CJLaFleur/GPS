exec {'1909':

  command => 'Get-WindowsUpdate -MicrosoftUpdate | Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot',

  provider => powershell,

}