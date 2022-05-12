class msoffice2016 {

package { office2016:
  ensure   => 'installed',
  provider => 'chocolatey',
  source   => 'ghs',
  }
}

