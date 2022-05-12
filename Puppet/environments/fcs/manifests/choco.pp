include chocolatey

exec {'addsource':

  command => 'choco source add -n=ghs -s="http://10.0.13.7/chocolatey"',

  provider => powershell,

}

exec {'allowemptychecksums':

  command => 'choco feature enable -n=allowemptychecksums',

  provider => powershell,

}

