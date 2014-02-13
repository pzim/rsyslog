# defined type for managing rsyslog imfiles
# example:
  #$tomcat_hash = hiera('profile::rsyslog::tomcat::imfile')

  #rsyslog::config_file { '/etc/rsyslog.d/tomcatForward.conf':
  #  config_hash => $tomcat_hash,
  #}

define rsyslog::config_file($config_hash) {
  file { $name:
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('rsyslog/rsyslog.config.erb'),
    notify  => Service['rsyslog'],
    require => Package['rsyslog'],
  }
}
