class testingpkgs {

$teacherpkgs = [ 'nwea', 'drc', 'testnav' ]

package { $teacherpkgs:
  ensure   => 'installed',
  provider => 'chocolatey',
  source   => 'ghs',
  }
}

