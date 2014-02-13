# == Class: rsyslog::install
#
# Responsible for installing the rsyslog package
#
class rsyslog::install {
  package{'rsyslog':
    ensure => $rsyslog::version
  }
}
