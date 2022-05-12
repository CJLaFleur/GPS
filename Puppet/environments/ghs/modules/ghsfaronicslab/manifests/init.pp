class ghsfaronicslab {

$ghsfaronicslab = [ 'ghsfaronicscorelab', 'ghsfaronicsae' ]

package { $ghsfaronicslab:
  ensure   => 'installed',
  provider => 'chocolatey',
  source   => 'ghs',
  }
}

