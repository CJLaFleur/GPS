file { 'windows.old' :
  ensure => 'absent',
  path => 'c:/windows.old',
  force => 'true',
  recurse => 'true'
}