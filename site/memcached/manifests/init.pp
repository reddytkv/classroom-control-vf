class memcached {

package { 'memcached' :
  ensure => present 
}

file { 'memcached config' :
  ensure => 'file',
  group =>  'root', 
  owner => 'root',
  mode  => '0644',
  source => 'puppet:///modules/memcached/memcached',
  require => Package['memcached'],

}

service { 'memcached' :
  ensure => 'running',
  enable  => 'true',
  subscribe => File['memcached config'],

}

}
