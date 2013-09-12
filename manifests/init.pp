define hostkey (
  $host   = $title,
  $path   = '/etc/ssh/ssh_known_hosts',
  $print  = undef,
) {

  if $print == undef {
    fail("You must specify a fingerprint via the 'print' parameter")
  }

  if ! defined( File['/tmp/ssh-knownhost'] ) {
    file { '/tmp/ssh-knownhost':
      owner  => root,
      group  => root,
      mode   => 755,
      source => 'puppet:///modules/hostkey/ssh-knownhost'
    }
  }

  exec { "known_host::$title":
    command   => "/tmp/ssh-knownhost $host $path $print",
    unless    => "test ! -z \"`ssh-keygen -f $path -F $host`\"",
    logoutput => true,
    require   => File['/tmp/ssh-knownhost'],
  }

}
