$gmsfaronics = [ 'gmsfaronicscore', 'gmsfaronicsae' ]

package { $gmsfaronics:
  ensure   => 'installed',
  provider => 'chocolatey',
  source   => 'ghs',
}