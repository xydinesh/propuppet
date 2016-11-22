class ssh::install {
  include ssh::params

  package {'ssh':
    name   => $ssh::params::ssh_package_name,
    ensure => present,
  }
}
