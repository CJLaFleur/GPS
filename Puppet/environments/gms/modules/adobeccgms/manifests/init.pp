class adobeccgms {

package { adobeccgms:
  ensure   => 'installed',
  provider => 'chocolatey',
  source   => 'ghs',
  }
}

