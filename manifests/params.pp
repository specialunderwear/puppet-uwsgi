class uwsgi::params {

  case $::operatingsystem {
    Debian,Ubuntu: {
      $configdir = '/etc/uwsgi/apps-enabled'
      $package = ['uwsgi']
    }
    default: {
      notify { "${module_name}_unsupported":
        message => "The ${module_name} module is not supported on ${operatingsystem}",
      }
    }
  }
}
