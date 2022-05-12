class teacherpkgs {

$teacherpkgs = [ 'smart', 'ipevo' ]

package { $teacherpkgs:
  ensure   => 'installed',
  provider => 'chocolatey',
  source   => 'ghs',
  }
}

