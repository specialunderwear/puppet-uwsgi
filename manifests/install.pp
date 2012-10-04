class uwsgi::install {
  package { $uwsgi::params::package:
    ensure => installed
  }

  if $uwsgi::params::plugins {
    package { $uwsgi::params::plugins_package:
      ensure => installed
    }
  }
}
