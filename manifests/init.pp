# == Class: yum
#
class yum(
            $http_proxy     = undef,
            $keepcache      = false,
            $debuglevel     = '2',
            $manage_package = true,
            $exclude        = [],
          ) inherits yum::params {

  file { '/etc/yum.conf':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/yumconf.erb"),
  }

  if($manage_package)
  {
    package { 'yum-utils':
      ensure => 'installed',
    }
  }
}
