# Class rsyslog::service
#
# Ensures rsyslog service is enabled and running
class rsyslog::service {
  $ensure = $rsyslog::start ? {true => running, default => stopped}

  service{'rsyslog':
    ensure  => $ensure,
    enable  => $rsyslog::enable,
  }
}
