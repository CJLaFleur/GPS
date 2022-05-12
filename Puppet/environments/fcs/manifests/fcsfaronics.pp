$fcsfaronics = [ 'fcsfaronicscore', 'fcsfaronicsae' ]

package { $fcsfaronics:
  ensure   => 'installed',
  provider => 'chocolatey',
  source   => 'ghs',
}