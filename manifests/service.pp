class ninjablocks::service(
  $user = $ninjablocks::user,
  $dir = $ninjablocks::dir) {

  file { '/etc/init/ninjablock.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '644',
    content => template('ninjablocks/ninjablock.conf.erb'),
  } ~>

  service { 'ninjablock':
    enable => true,
    ensure => running,
  } ->

  anchor { 'ninjablocks::service': }
}
