# Install driver dependencies
define ninjablocks::driver::npm_install(
  $user = $ninjablocks::user,
  $dir = $ninjablocks::dir) {

  Exec{ path => ['/bin','/usr/bin'], user => $user }

  exec { "ninja-driver-npm-${name}":
    command => "npm install && touch installed.puppet",
    cwd     => "${dir}/drivers/${name}",
    creates => "${dir}/drivers/${name}/installed.puppet",
    notify  => Service['ninjablock'],
  }

}
