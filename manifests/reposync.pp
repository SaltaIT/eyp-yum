define yum::reposync(
                      $repo_path,
                      $repo_id      = $name,
                      $metadata     = true,
                      $gpgcheck     = true,
                      $comps        = true,
                      $hour         = '2',
                      $minute       = '0',
                      $month        = undef,
                      $monthday     = undef,
                      $weekday      = undef,
                      $cron_ensure  = 'present',
                      $cron_enabled = true,
                    ) {

  include ::yum

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
      package { 'createrepo':
        ensure  => 'installed',
        require => Class['::yum'],
      }

      #reposync --gpgcheck -l --repoid=rhel-6-server-rpms --download_path=/var/www/html --downloadcomps --download-metadata
      cron { "cronjob tarball backup ${tarbackup::backupscript}":
        command  => inline_template("<% if ! @cron_enabled %>/bin/true # <% end %>reposync <% if @gpgcheck %>--gpgcheck<% end %> -l --repoid=${repo_id} --download_path=${repo_path} <% if @comps %>--downloadcomps<% end %> <% if @metadata %>--download-metadata<% end %>"),
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
