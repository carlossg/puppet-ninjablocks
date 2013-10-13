require 'spec_helper'

describe 'ninjablocks' do

  shared_context 'a ninja' do
    it { should contain_package('nodejs') }
    it { should contain_package('npm') }
    it { should contain_package('nodejs-dev') }
    it { should contain_service('ninjablock').with(
      :ensure => 'running',
      :enable => true) }
  end

  context 'when using ubuntu' do
    let(:facts) {{
      :operatingsystem => 'ubuntu',
      :lsbdistcodename => 'precise'
    }}

    it_behaves_like 'a ninja'
  end

  context 'when using debian' do
    let(:facts) {{
      :operatingsystem => 'debian'
    }}

    it_behaves_like 'a ninja'
  end
end
