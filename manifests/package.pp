class ninjablocks::package {

  ensure_packages(['git'])

  ensure_resource('package', ['node-gyp', 'ninja-toolbelt'], {'ensure' => 'present', 'provider' => 'npm'})

  # ensure npm packages are installed after npm
  Anchor['ninjablocks::prereq'] -> Package['node-gyp', 'ninja-toolbelt'] -> Anchor['ninjablocks::package']

  Package['git'] -> Anchor['ninjablocks::package']

  anchor { 'ninjablocks::package': }
}
