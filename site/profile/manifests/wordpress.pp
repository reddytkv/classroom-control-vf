class profile::wordpress {
  class { ::wordpress :
    db_user     => 'wordpress',
    db_name     => 'wordpress',
    db_host     => $::ipaddress_lo,
    install_dir => '/opt/wordpress',
  }
}
