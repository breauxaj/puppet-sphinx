class sphinx (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'sphinx',
  }

  package { $required: ensure => $ensure }

}
