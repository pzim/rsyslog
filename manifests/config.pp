# Class rsyslog::config
#
# Manages config files that are part of the rsyslog package
class rsyslog::config {
  file { '/etc/rsyslog.conf':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/rsyslog/etc/rsyslog.conf',
  }
  file { '/etc/rsyslog.d/remoteConfig.conf':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('rsyslog/remoteConfig.erb'),
    require => File['/etc/rsyslog.conf'],
  }
}
