class ssh::params {

  case $::osfamily {
    'redHat': {
      $ssh_package_name = 'openssh-server'
      $ssh_service_name = 'sshd'
    }
    'deBian': {
      $ssh_package_name = 'openssh-server'
      $ssh_service_name = 'ssh'
    }
    defualt: { 
      fail("Module propuppet-ssh does not support osfamily: ${::osfamily}")
    } 
  }
}

