package { 'gmsavast':
  ensure   => 'absent',
  provider => 'chocolatey',
  source   => 'ghs',
}
