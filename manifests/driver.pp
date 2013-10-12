define ninjablocks::driver(
  $git,
  $user = $ninjablocks::user,
  $dir = $ninjablocks::dir) {

  Exec{ path => ['/bin','/usr/bin'], user => $user }

  exec { "ninja-driver-git-${name}":
    command => "git clone ${git} ${name}",
    cwd     => "${dir}/drivers",
    creates => "${dir}/drivers/${name}",
    require => Anchor['ninjablocks::package'],
    notify  => Service['ninjablock'],
  } ~>
  ninjablocks::driver::npm_install { $name: }

}
