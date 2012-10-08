define uwsgi::app (
  $socket,
  $ensure = 'present',
  $processes = $::processorcount,
  $master = true,
  $plugins = '',
  $rack = false,
  $postbuffering = false,
) {

  if $plugins {
    if $rack {
      package { $uwsgi::params::rack_plugin:
        ensure => installed,
      }
    }
  }

  file { "${uwsgi::params::configdir}/${name}.ini":
    ensure  => $ensure,
    mode    => '0644',
    content => template('uwsgi/app.ini'),
  }
}
