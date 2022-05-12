class msoffice2013 {

package { office2013:
  ensure   => 'installed',
  provider => 'chocolatey',
  source   => 'ghs',
  }
}

