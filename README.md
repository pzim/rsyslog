rsyslog
=======

Module to install and configure rsyslog


###Overview

This module will install, configure and run rsyslog.

###Simple install

In order to install rsyslog, simply include it:

```include rsyslog```

###Parameters

```
[*version*]
   The package version to install
   defaults to "installed"

[*server*]
  The remote rsyslog server
  Required to set this parameter

[*server_port*]
  The remote rsyslog server port
  defaults to "514"

[*enable*]
  Should the service be enabled during boot time?
  defaults to "true"

[*start*]
  Should the service be started by Puppet
  defaults to "true"
```

###rsyslog::config_file defined type

The rsyslog::config_file defined type allows for creation/configuration of 
rsyslog im files.

It takes a single argument - a hash representing the im file settings.

###Example Usage:

hash as defined in hiera:

```
  audit:
    InputFileName: /data/logs/myapp/audit.log
    InputFileTag: myapp-audit
    InputFileStateFile: myapp-audit-state
    InputFileSeverity: info
    InputFileFacility: local6
```

usage in puppet manifest:

```
$audit_hash = hiera('my::audit_hash')

rsyslog::config_file { '/etc/rsyslog.d/audit.conf':
  config_hash => $audit_hash,
}
```
###Testing the Module

From the top level of this module:
* bundle install
* rake spec
