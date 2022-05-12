$packages = [ 'adobeair', 'dotnet4.5.2', 'vcredist-all' ]

package { $packages:
  ensure   => 'installed',
  provider => 'chocolatey',
  source   => 'chocolatey',
}

