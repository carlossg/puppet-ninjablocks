class ninjablocks::install {

  Exec{ path => ['/bin','/usr/bin'], user => $ninjablocks::user }

  # apt::source { 'ninjablocks':
  #   location          => 'http://releases.ninjablocks.com/',
  #   release           => 'wheezy',
  #   repos             => 'beta',
  #   key               => '0E86E52B682BF664',
  #   key_server        => 'keyserver.ubuntu.com',
  #   include_src       => false,
  # }

  file { $ninjablocks::dir:
    ensure => directory,
    owner  => $ninjablocks::user,
    group  => $ninjablocks::user,
  } ->
  file { "/etc/opt/ninja":
    ensure => directory,
    owner  => $ninjablocks::user,
    group  => $ninjablocks::user,
  } ->
  exec { 'git clone git://github.com/ninjablocks/client.git ninja':
    cwd     => regsubst($ninjablocks::dir, '^(.*)/[a-z0-9]*$', '\1', 'I'), # parent dir
    creates => "${ninjablocks::dir}/.git",
    require => Anchor['ninjablocks::package'],
  } ->
  exec { 'git checkout develop':
    cwd    => $ninjablocks::dir,
    unless => 'test `git rev-parse --abbrev-ref HEAD` = develop',
  } ->
  exec { 'npm install':
    cwd     => $ninjablocks::dir,
    creates => "${ninjablocks::dir}/node_modules",
  } ->

  # install the default drivers dependencies
  ninjablocks::driver::npm_install { ['common', 'network', 'rest']: } ->

  anchor { 'ninjablocks::install': }

}
