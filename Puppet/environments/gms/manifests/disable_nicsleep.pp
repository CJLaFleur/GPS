registry_value { 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}\0001\PnPCapabilities':
    ensure => present,
    type => dword,
    data => "24",
}