class nginx::params {
  case $::osfamily {
    'redhat','debian': {
      $package         = 'nginx'
      $owner           = 'root'
      $group           = 'root'
      $default_docroot = '/var/www'
      $confdir         = '/etc/nginx'
      $logdir          = '/var/log/nginx'
    }
    'windows': {
      $package         = 'nginx-service'
      $owner           = 'Administrator'
      $group           = 'Administrators'
      $default_docroot = 'C:/ProgramData/nginx/html'
      $confdir         = 'C:/ProgramData/nginx'
      $logdir          = 'C:/ProgramData/nginx/logs'
    }
    default : {
      fail("Module ${module_name} is not intended to run on ${::osfamily}")
    }
  }
  
  $runas_user = $::osfamily ? {
    'redhat'  => 'nginx',
    'debian'  => 'www-data',
    'windows' => 'nobody',
  }

}

