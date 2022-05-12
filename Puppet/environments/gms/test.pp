
file { 'C:/test.txt':
ensure => 'absent',
content => "testing 123"
}
