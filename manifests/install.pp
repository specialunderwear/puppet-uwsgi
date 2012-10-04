class uwsgi::install {
  package { $uwsgi::params::package:
    ensure => installed
  }

  if $uwsgi::params::plugins {
    package { $uwsgi::paramas::plugins_package:
      ensure => installed
    }
  }
}
