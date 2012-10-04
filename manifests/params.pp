class uwsgi::params {

  # Enable plugins
  $plugins = true

  $package = ['uwsgi']
  $plugins_package = ['uwsgi-plugin-rack-ruby1.8']
}
