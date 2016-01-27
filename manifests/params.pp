class yum::params {

  # -installonly_limit=5
  # -bugtracker_url=http://bugs.centos.org/set_project.php?project_id=16&ref=http://bugs.centos.org/bug_report_page.php?category=yum
  # -distroverpkg=centos-release
  # +installonly_limit=3


  case $::osfamily
  {
    'redhat':
    {
      case $::operatingsystem
      {
        'CentOS':
        {
          case $::operatingsystemrelease
          {
            /^6.*/:
            {
              $installonly_limit=5
              $bugtracker_url='http://bugs.centos.org/set_project.php?project_id=16&ref=http://bugs.centos.org/bug_report_page.php?category=yum'
              $distroverpkg='centos-release'
            }
            default: { fail('Unsupported') }
          }
        }
        'RedHat':
        {
          case $::operatingsystemrelease
          {
            /^6.*/:
            {
              $installonly_limit=3
              $bugtracker_url=undef
              $distroverpkg=undef
            }
            default: { fail('Unsupported') }
          }
        }
        default: { fail('Unsupported') }
      }
    }
    'Debian':
    {
      fail('Unsupported')
    }
    default: { fail('Unsupported')  }
  }
}
