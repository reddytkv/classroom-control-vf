class profile::mysql {
  class { '::mysql::server':
    root_password => 'yesyesyes',
  }
  
  class { '::mysql::bindings' :
    php_enable => true,
  }
}
