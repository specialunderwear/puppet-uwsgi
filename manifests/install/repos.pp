class uwsgi::install::repos {
  case $::operatingsystem {
    redhat,centos,fedora,Scientific: {
      require graphite::install::repos
    }
    default: { fail("${::hostname}: This module does not support operatingsystem ${::operatingsystem}") }
  }
}
