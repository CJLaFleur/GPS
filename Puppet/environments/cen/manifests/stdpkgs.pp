$stdpkgs = [ 'vlc', 'adobereader', 'googlechrome', 'zoom' ]

package { $stdpkgs:
  ensure   => 'installed',
  provider => 'chocolatey',
  source   => 'chocolatey',
}

