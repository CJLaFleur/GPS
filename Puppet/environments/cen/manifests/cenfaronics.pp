$cenfaronics = [ 'cenfaronicscore', 'cenfaronicsae' ]

package { $cenfaronics:
  ensure   => 'installed',
  provider => 'chocolatey',
  source   => 'ghs',
}
