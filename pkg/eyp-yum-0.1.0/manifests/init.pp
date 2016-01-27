# == Class: yum
#
class yum($http_proxy=undef) inherits yum::params {

  file { '/etc/yum.conf':
    ensure => 'present',
    owner => 'root',
    group => 'root',
    mode => '0644',
    content => template("${module_name}/yumconf.erb")
  }


}
