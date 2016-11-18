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
          $installonly_limit=5
          $distroverpkg='centos-release'
          case $::operatingsystemrelease
          {
            /^6.*/:
            {

              $bugtracker_url='http://bugs.centos.org/set_project.php?project_id=16&ref=http://bugs.centos.org/bug_report_page.php?category=yum'
            }
            /^7.*/:
            {

              $bugtracker_url='http://bugs.centos.org/set_project.php?project_id=23&ref=http://bugs.centos.org/bug_report_page.php?category=yum'
            }
            default: { fail('Unsupported') }
          }
        }
        'RedHat':
        {
          $installonly_limit=3
          $bugtracker_url=undef
          $distroverpkg=undef
          case $::operatingsystemrelease
          {
            /^[67].*/:
            {
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
