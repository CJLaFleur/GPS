class threetwentyninepkgs {

$threetwentyninepkgs = [ 'scratch', 'legostudent', 'obsstudio' ]

package { $threetwentyninepkgs:
  ensure   => 'installed',
  provider => 'chocolatey',
  source   => 'ghs',
  }

package { firealpaca:
  ensure   => 'installed',
  provider => 'chocolatey',
  source   => 'chocolatey',
  }
}

