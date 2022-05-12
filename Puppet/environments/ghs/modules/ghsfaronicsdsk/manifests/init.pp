class ghsfaronicsdsk {

$ghsfaronicslab = [ 'ghsfaronicscore', 'ghsfaronicsae' ]

package { $ghsfaronicslab:
  ensure   => 'installed',
  provider => 'chocolatey',
  source   => 'ghs',
  }
}

