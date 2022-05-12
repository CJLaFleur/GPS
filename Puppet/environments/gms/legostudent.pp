if  'gmslab' in $hostname{
package { 'legostudent':
  ensure   => 'installed',
  provider => 'chocolatey',
  source   => 'ghs',
}
}
