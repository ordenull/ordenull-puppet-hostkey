# Resource: hostkey
# ===========================
#
# This module manages SSH host keys and the known_hosts file
#
# Parameters
# ----------
#
# * `host`
#  The hostname of the server which needs to be accepted into known_hosts.
#
# * `path`
#  The path of the known_hosts file to use. If ommited the systemwide
#  /etc/ssh/ssh_known_hosts will be assumed.
#
# * `print`
#  The fingerprint of the host specified in the host field.
#
# Examples
# --------
#
# @example
#    hostkey { 'github.com': 
#      print => '16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48'
#    }
#
# @example
#    hostkey { 'bitbucket.org': 
#      path  => '/root/.ssh/known_hosts',
#      print => '97:8c:1b:f2:6f:14:6b:5c:3b:ec:aa:46:46:74:7c:40',
#    }
#
# Authors
# -------
#
# Stan Borbat <stan@borbat.com>
#
# Copyright
# ---------
#
# Copyright 2016 Stan Borbat, unless otherwise noted.
#
define hostkey (
  $host   = $title,
  $path   = '/etc/ssh/ssh_known_hosts',
  $print  = undef,
) {

  if $print == undef {
    fail("You must specify a fingerprint via the 'print' parameter")
  }

  if ! defined( File['/usr/local/bin/ssh-knownhost'] ) {
    file { '/usr/local/bin/ssh-knownhost':
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
      source => 'puppet:///modules/hostkey/ssh-knownhost'
    }
  }

  exec { "known_host::$title":
    command   => "/usr/local/bin/ssh-knownhost $host $path $print",
    unless    => "/usr/bin/test ! -z \"`/usr/bin/ssh-keygen -f $path -F $host`\"",
    logoutput => true,
    require   => File['/usr/local/bin/ssh-knownhost'],
  }

}
