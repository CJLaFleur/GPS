class testingpkgs {

$teacherpkgs = [ 'nwea', 'drc' ]

package { $teacherpkgs:
  ensure   => 'installed',
  provider => 'chocolatey',
  source   => 'ghs',
  }
}

