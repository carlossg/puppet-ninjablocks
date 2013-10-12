require 'spec_helper'

describe 'ninjablocks::driver' do

  let(:facts) {{
    :operatingsystem => 'ubuntu',
    :lsbdistcodename => 'precise'
  }}

  let(:name) { 'ninja-presence-base' }
  let(:params) {{
    :git => 'https://github.com/elliots/ninja-presence-base.git'
  }}

  it { should contain_exec('ninja-driver-git-ninja-presence-base') }
  it { should contain_exec('ninja-driver-npm-ninja-presence-base') }
end
