class yum::params {

  case $::osfamily
  {
    'redhat':
    {
      case $::operatingsystemrelease
      {
        /^6.*/:
        {
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
