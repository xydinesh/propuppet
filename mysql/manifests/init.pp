# Class: mysql
# ===========================
#
# Full description of class mysql here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'mysql':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class mysql (
  $group = 'mysql',
  $user = 'mysql',
  $service_enabled = true,
  $service_running = true
){

  class { 'mysql::install':
    user  => $user,
    group => $group,
  }

  class { 'mysql::config':
    user  => $user,
    group => $group,
  }

  class { 'mysql::service':
    enabled => $service_enabled,
    ensure  => $service_running,
  }
}
