class ninjablocks::prereq($version = $ninjablocks::node_version) {

  case $::operatingsystem {

   'ubuntu': {
      $node_version = '0.8.25-2chl1~precise1'

      apt::ppa { 'ppa:chris-lea/node.js-legacy':
        before  => Anchor['nodejs::repo'],
      }

      # The nodejs module doesn't install npm in ubuntu
      ensure_packages(['npm'])
      Package['nodejs-dev'] -> Package['npm']
    }

    default: {
      # TODO use compatible versions in other OSs
      $node_version = 'present'
    }
  }

  class { 'nodejs':
    version     => $version ? { undef => $node_version, default => $version },
    dev_package => true,
  } ->

  anchor { 'ninjablocks::prereq':
    require => Package['npm'],
  }
  Package['nodejs'] -> Package['nodejs-dev']

}
