exec {'killonedrive':

  command => 'taskkill /f /im OneDrive.exe',

  provider => powershell,

}

exec {'uninstonedrive':

  command => '%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall',

  provider => powershell,

}

