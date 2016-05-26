class profile::apache {

  $wp_home = '/opt/wordpress'
  $blog_name = 'blog'

  host { "${blog_name}.puppetlabs.vm" :
    ensure       => present,
    host_aliases => [$blog_name],
    ip           => $::ipaddress,
  }

  include ::apache
  include ::apache::mod::php
  
  
  file { $wp_home :
    ensure => directory,
  }

  apache::vhost { $::fqdn :
    port    => '80',
    docroot => $wp_home,
    require => File[$wp_home],
  }


}
