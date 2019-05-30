# == Class: yum
#
class yum(
            $http_proxy       = undef,
            $keepcache        = false,
            $debuglevel       = '2',
            $manage_package   = true,
            $exclude          = [],
            $gpgcheck         = true,
            $obsoletes        = true,
            $plugins          = true,
            $enforce_gpgcheck = false,
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

  if($enforce_gpgcheck)
  {
    if ($gpgcheck)
    {
      $gpgcheck_str='1'
    }
    else
    {
      $gpgcheck_str='0'
    }

    exec { 'enforce gpgcheck':
      command => "sed 's/^gpgcheck=.*/gpgcheck=${gpgcheck_str}/g' -i /etc/yum.repos.d/*.repo",
      path    => '/usr/sbin:/usr/bin:/sbin:/bin',
      onlyif  => "grep gpgcheck= /etc/yum.repos.d/*.repo | grep -E 'gpgcheck=[^${gpgcheck_str}]'",
    }
  }
}
