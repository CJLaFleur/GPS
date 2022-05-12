if  'gmslab' in $hostname{
package { 'scratch':
  ensure   => 'installed',
  provider => 'chocolatey',
  source   => 'ghs',
}
}
