$nesfaronics = [ 'nesfaronicscore', 'nesfaronicsae' ]

package { $nesfaronics:
  ensure   => 'installed',
  provider => 'chocolatey',
  source   => 'ghs',
}