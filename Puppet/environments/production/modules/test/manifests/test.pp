class testclass {
file { 'C:/test.txt':
ensure => 'present',
content => "testing 123"
}
}
