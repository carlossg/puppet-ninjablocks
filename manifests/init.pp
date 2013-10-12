class ninjablocks(
  $node_version = $ninjablocks::params::node_version,
  $user = $ninjablocks::params::user,
  $dir = $ninjablocks::params::dir) inherits ninjablocks::params {

  class { 'ninjablocks::prereq': }
  class { 'ninjablocks::package': }
  class { 'ninjablocks::install': }
  class { 'ninjablocks::service': }

}
