class uwsgi::install($version) {
  package { "uwsgi":
    ensure => $version
  }
}