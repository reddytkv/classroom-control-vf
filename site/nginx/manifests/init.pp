class nginx {
  file { 'nginx rpm' :
    ensure  =>  file,
    path    =>  'opt/nginx-1.6.2-el7.centos.ngx.x86_64.rpm',
    source  =>  'puppet:///modules/nginx/nginx-1.6.2-1.e17.centos.ngx.x86_64.rpm',
  }

package { ''nginx'  :
  ensure  =>  '1.6.2-e17.centos.ngx',
  source  =>  '/opt/nginx-1.6.2-1.el7.centos.ngx.x86_64.rpm',
  provider  => rpm,
  require => File['nginx rpm'],
}

}
