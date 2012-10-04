class uwsgi {
  include uwsgi::params
  include uwsgi::install
  include uwsgi::config
  include uwsgi::service
}

