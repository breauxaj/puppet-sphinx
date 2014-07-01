class sphinx (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'sphinx',
  }

  $paths = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [
      '/var/log/sphinx'
    ],
  }

  package { $required: ensure => $ensure }

  group { 'sphinx':
    ensure => present,
    gid    => 9312,
  }

  user { 'sphinx':
    ensure     => present,
    gid        => 9312,
    home       => '/var/lib/sphinx',
    shell      => '/sbin/nologin',
    managehome => true,
    uid        => 9312,
  }

  file { $paths:
    ensure => directory,
    owner  => 'sphinx',
    group  => 'sphinx',
    mode   => '0755',
  }

}
