class uwsgi::service {
  service {'uwsgi':
    ensure     => 'running',
    enable     => true,
    hasrestart => true,
    hasstatus  => false,
    refreshonly => true
  }
}
