exec {'executionpolicy':

  command => 'Set-ExecutionPolicy RemoteSigned -Force',

  provider => powershell,

}