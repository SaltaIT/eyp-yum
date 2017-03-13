# [local-repo-name]
# metadata_expire = 86400
# baseurl = http://X.X.X.X/repo_directory
# mirrorlist=
# name = Local Repository for RHEL 6
# enabled = 1
# gpgcheck = 0
define yum::repo(
                  $ensure          = 'present',
                  $repo_name       = $name,
                  $metadata_expire = undef,
                  $baseurl         = undef,
                  $mirrorlist      = undef,
                  $description     = undef,
                  $enabled         = true,
                  $gpgcheck        = true,
                ) {
  #
  if($baseurl==undef and $mirrorlist==undef)
  {
    fail('please define either baseurl or mirrorlist')
  }

  if($baseurl!=undef and $mirrorlist!=undef)
  {
    fail('please define either baseurl or mirrorlist but not both')
  }

  #repo_name
  file { "/etc/yum.repos.d/${repo_name}.repo":
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/repo.erb"),
  }
}
