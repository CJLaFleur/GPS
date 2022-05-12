exec {'nomemdump':

  command => 'Get-WmiObject -Class Win32_OSRecoveryConfiguration -EnableAllPrivileges | Set-WmiInstance -Arguments @{ DebugInfoType=0 }
',

  provider => powershell,

}