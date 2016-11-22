class mysql::service (
  $enabled,
  $ensure
){
  service { 'mysql':
    hasstatus  => true,
    hasrestart => true,
    require    => Class['mysql::config'],
    ensure     => $ensure,
  }
} 
