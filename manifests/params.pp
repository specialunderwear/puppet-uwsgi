class uwsgi::params {

  case $::operatingsystem {
    Debian,Ubuntu: {
      $configdir = '/etc/uwsgi/apps-enabled'
      $package = ['uwsgi']
      $rack_plugin = ['uwsgi-plugin-rack-ruby1.8','rubygems','ruby-rack']
    }
    default: {
      notify { "${module_name}_unsupported":
        message => "The ${module_name} module is not supported on ${operatingsystem}",
      }
    }
  }
}
