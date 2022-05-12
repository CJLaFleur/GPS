package { 'office2013':
  ensure   => 'absent',
  provider => 'chocolatey',
  source   => 'ghs',
}

