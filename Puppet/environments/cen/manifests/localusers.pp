exec { 'disableadministrator':
   command => 'Disable-LocalUser -Name "Administrator"',
   provider => powershell,
}

user { 'gpsadmin':
   ensure => present,
   password => 'wUl8+Wljdj',
   groups => 'Administrators',
}
