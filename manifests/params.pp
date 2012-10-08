class uwsgi::params {

  # Enable plugins
  $plugins = true

  case $::operatingsystem {
    Debian,Ubuntu: {
      $configdir = '/etc/uwsgi/apps-enabled'
      $package = ['uwsgi']
      $plugins_package = ['uwsgi-plugin-rack-ruby1.8']
    }
    default: {
      notify { "${module_name}_unsupported":
        message => "The ${module_name} module is not supported on ${operatingsystem}",
      }
    }
  }
}
