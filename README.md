puppet-ninjablocks
=================

Puppet module to install [ninjablocks](http://www.ninjablocks.com) client and dependencies automatically from a new box.

Tested under Ubuntu-12.04 'precise', see Vagrant section below.


# Usage

    class { 'ninjablocks':
      user => 'vagrant',
    }

You can pass the user to install the node modules as, otherwise root is used.


## Drivers

You can install any drivers with `ninjablocks::driver` setting the name and git repo of the driver

    ninjablocks::driver { 'ninja-presence-wifi-ap':
      git => 'https://github.com/elliots/ninja-presence-wifi-ap.git',
    }

See [tests/site.pp](blob/master/tests/site.pp) for examples of several drivers.

# Installation

Install from the Puppet Forge with

    puppet module install csanchez/ninjablocks

# Building

Just get the gems with bundler and run rake to get the dependent modules and run the specs

    bundle
    rake


# Vagrant

The module includes a [Vagrant](http://vagrantup.com) definition to create a new virtual machine from scratch and install the ninjablocks client.
`vagrant up` will create an ubuntu box and install the ninjablocks client and several drivers, as defined in [tests/site.pp](blob/master/tests/site.pp).

You may need to run bundler and rake before in order to get the module dependencies

    bundle
    rake

# Author

[Carlos Sanchez](http://csanchez.org)

Licensed under the Apache License, Version 2.0
