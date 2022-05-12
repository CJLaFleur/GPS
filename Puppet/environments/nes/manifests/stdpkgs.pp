$stdpkgs = [ 'vlc', 'adobereader', 'googlechrome' ]

package { $stdpkgs:
  ensure   => 'installed',
  provider => 'chocolatey',
  source   => 'chocolatey',
}

