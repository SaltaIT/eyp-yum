define yum::reposync(
                      $repo_path,
                      $repo_id               = $name,
                      $metadata              = true,
                      $gpgcheck              = true,
                      $comps                 = true,
                      $hour                  = '2',
                      $minute                = '0',
                      $month                 = undef,
                      $monthday              = undef,
                      $weekday               = undef,
                      $cron_ensure           = 'present',
                      $cron_enabled          = true,
                      $basedir               = '/opt/reposync',
                      $purge_before_reposync = false,
                    ) {

  include ::yum

  if(!defined(Exec['mkdir basedir reposync']))
  {
    exec { 'mkdir basedir reposync':
      command => "mkdir -p ${basedir}",
      creates => $basedir,
    }
  }

  file { "${basedir}/reposync_${repo_id}":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template("${module_name}/reposync/reposync.erb"),
    require => Exec['mkdir basedir reposync'],
  }

  if(!defined(Exec["mkdir p eyp yum reposyn ${repo_path}"]))
  {
    exec { "mkdir p eyp yum reposyn ${repo_path}":
      command => "mkdir -p ${repo_path}",
      creates => $repo_path,
      path    => '/usr/sbin:/usr/bin:/sbin:/bin',
      before  => Cron["cronjob tarball backup ${repo_id}"],
    }

    file { $repo_path:
      ensure  => 'directory',
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      require => Exec["mkdir p eyp yum reposyn ${repo_path}"],
      before  => Cron["cronjob tarball backup ${repo_id}"],
    }

  }

  case $::operatingsystem
  {
    # proves amb centos
    'CentOS':
    {
      # https://wiki.centos.org/HowTos/CreateLocalMirror
      fail('TODO: rsync')
    }
    'RedHat':
    {
      if(!defined(Package['createrepo']))
      {
        package { 'createrepo':
          ensure  => 'installed',
          require => Class['::yum'],
        }
      }

      #reposync --gpgcheck -l --repoid=rhel-6-server-rpms --download_path=/var/www/html --downloadcomps --download-metadata
      cron { "cronjob tarball backup ${repo_id}":
        command  => inline_template("<% if ! @cron_enabled %>/bin/true # <% end %>/bin/bash ${basedir}/reposync_${repo_id}"),
        user     => 'root',
        hour     => $hour,
        minute   => $minute,
        month    => $month,
        monthday => $monthday,
        weekday  => $weekday,
        require  => Package['createrepo'],
      }
    }
    default:
    {
      fail("unsupported OS: ${::operatingsystem}")
    }
  }
}
