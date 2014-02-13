# == Class: rsyslog
#
# A basic module to manage rsyslog
#
# === Parameters
# [*version*]
#   The package version to install
#
# [*server*]
#   The remote rsyslog server
#
# [*server_port*]
#   The remote rsyslog server port
#
# [*enable*]
#   Should the service be enabled during boot time?
#
# [*start*]
#   Should the service be started by Puppet
class rsyslog(
  $version = 'installed',
  $server = undef,
  $server_port = '514',
  $enable = true,
  $start = true,
) {
    class{'rsyslog::install': } ->
    class{'rsyslog::config': } ~>
    class{'rsyslog::service': } ->
    Class['rsyslog']
}
