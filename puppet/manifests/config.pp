class puppet::config {
  include puppet::params

  file { "/etc/puppetlabs/puppet/puppet.conf":
    ensure  => present,
    owner   => 'puppet',
    group   => 'puppet',
    content => template('puppet/puppet.conf.erb'),
    require => Class['puppet::install'],
    notify  => Class['puppet::service'],
  }
}
