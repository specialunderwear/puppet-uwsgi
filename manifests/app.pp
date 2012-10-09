define uwsgi::app (
  $socket,
  $ensure = 'present',
  $processes = $::processorcount,
  $master = true,
  $plugins = '',
  $rack = false,
  $postbuffering = false,
  $uid = 'www-data',
  $gid = 'www-data',
  $touchreload = '/tmp/reload.txt',
) {

  if $plugins {
    if $rack {
      package { $uwsgi::params::rack_plugin:
        ensure  => installed,
        require => File[$rack],
        notify  => Class['uwsgi::service'],
      }
    }
  }

  file { "${uwsgi::params::configdir}/${name}.ini":
    ensure  => $ensure,
    mode    => '0644',
    content => template('uwsgi/app.ini'),
    notify  => Class['uwsgi::service'],
  }
}
