class memcached {
  package { 'memcached' :
    ensure => present,
  }
  
  file { 'memcached config' :
    ensure  => file,
    path    => '/etc/sysconfig/memcached',
    group   => 'root',
    mode    => '0644',
    owner   => 'root',
    source  => 'puppet:///modules/memcached/memcached',
    require => Package['memcached'],
  }
  
  service { 'memcached' :
    ensure    => running,
    enable    => true,
    subscribe => File['memcached config'],
  }
 }
 
