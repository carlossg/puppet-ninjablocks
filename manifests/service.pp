class ninjablocks::service(
  $user = $ninjablocks::user,
  $dir = $ninjablocks::dir) {

  file { '/etc/init/ninjablock.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '644',
    content => template('ninjablocks/ninjablock.conf.erb'),
    notify  => Service['ninjablock'],
  }

  file { '/etc/init.d/ninjablock':
    owner   => 'root',
    group   => 'root',
    mode    => '755',
    content => template('ninjablocks/ninjablock.erb'),
    notify  => Service['ninjablock'],
  }

  service { 'ninjablock':
    enable => true,
    ensure => running,
  } ->

  anchor { 'ninjablocks::service': }
}
