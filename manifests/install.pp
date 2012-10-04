class uwsgi::install {
  require uwsgi::install::repos
  include user::uwsgi

  Group <| title == uwsgi |>
  User <| title == uwsgi |> {
    before => Package ['uwsgi'],
  }

  package {'uwsgi':
    ensure => installed
  }
}
