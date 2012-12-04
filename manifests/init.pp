class uwsgi($version='latest') {
  class {"uwsgi::install":
      $version => $version,
  } ->
  class {"uwsgi::service":}
}