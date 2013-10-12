node default {

  class { 'ninjablocks':
    user => 'vagrant',
  }

  # ninjablocks::driver { 'ninja-philips-hue':
  #   git => 'https://github.com/thatguydan/ninja-hue.git',
  # }
  ninjablocks::driver { 'ninja-ipcam':
    git => 'https://github.com/ninjablocks/ninja-ipcam.git',
  }
  # ninjablocks::driver { 'ninja-limitlessLED':
  #   git => 'https://github.com/jzGreen/ninja-limitlessLED.git',
  # }
  ninjablocks::driver { 'common/libNBComms':
    git => 'https://github.com/ninjablocks/libNBComms.git',
  }
  # ninjablocks::driver { 'ninja-zwave':
  #   git => 'https://github.com/ninjablocks/ninja-zwave.git',
  # }
  # ninjablocks::driver { 'ninja-usbcam':
  #   git => 'https://github.com/nexxy/ninja-usbcam.git',
  # }
  # ninjablocks::driver { 'ninja-arduino':
  #   git => 'https://github.com/ninjablocks/ninja-arduino.git',
  # }

  ninjablocks::driver { 'ninja-presence-base':
    git => 'https://github.com/elliots/ninja-presence-base.git',
  }
  ninjablocks::driver { 'ninja-presence-wifi-ap':
    git => 'https://github.com/elliots/ninja-presence-wifi-ap.git',
  }
  ninjablocks::driver { 'ninja-presence-upnp':
    git => 'https://github.com/elliots/ninja-presence-upnp.git',
  }
}
