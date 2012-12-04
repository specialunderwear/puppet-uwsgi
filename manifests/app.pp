define uwsgi::app (
  $socket='/var/run/uwsgi.sock',
  $logto='/var/log/uwsgi.log'
  $touchreload="/var/run/uwsgi-reload-${title}",
  $processes=$::processorcount,
) {

  file { "${uwsgi::params::configdir}/${name}.ini":
    ensure  => 'file',
    overwrite => true,
    mode    => '0644',
    content => template('uwsgi/wsgi.xml.erb'),
    notify  => Class['uwsgi::service'],
  }

  # you can reload an app with reloading uwsgi itself
  exec {"uwsgi-reload-${title}":
      path => ['/usr/bin'],
      command => "touch ${touchreload}",
      refreshonly => true
  }
}
