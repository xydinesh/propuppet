class mysql::config (
  $user,
  $group
){
  
  file { '/opt/csw':
    ensure => directory,
    owner => $user,
    group => $group
  } ->
  file { '/opt/csw/mysql5':
    ensure => directory,
    owner  => $user,
    group  => $user,
    before => File['/opt/csw/mysql5/my.cnf'],
  }

  file { '/opt/csw/mysql5/my.cnf':
    audit   => [owner, group, mode],
    ensure  => present,
    source  => "puppet:///modules/mysql/my.cnf",
    owner   => $user,
    group   => $group,
    require => Class['mysql::install'],
    notify  => Class['mysql::service'], 
  }

  file { '/opt/csw/mysql5/var/':
    ensure => present,
    owner => $user,
    group => $group,
    recurse => true,
    require => File['/opt/csw/mysql5/my.cnf'],
  }
}
