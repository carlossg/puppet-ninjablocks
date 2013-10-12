require 'spec_helper'

describe 'ninjablocks' do

  let(:facts) {{
    :operatingsystem => 'ubuntu',
    :lsbdistcodename => 'precise'
  }}

  it { should contain_package('nodejs') }
  it { should contain_package('npm') }
  it { should contain_package('nodejs-dev') }
  it { should contain_service('ninjablock').with(
    :ensure => 'running',
    :enable => true) }
end
