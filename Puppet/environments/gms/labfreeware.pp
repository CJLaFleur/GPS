if  'gmslab' in $hostname{

$pkgs = [ 'obsstudio', 'firealpaca' ]

package { $pkgs:
  ensure   => 'installed',
  provider => 'chocolatey',
  source   => 'chocolatey',
}
}
