require 'chef/knife'
require 'chef/knife/swap_base'

describe Chef::Knife::SwapBase do
  include Chef::Knife::SwapBase

  before do
    config_loader = Chef::Knife.config_loader
    allow(config_loader).to receive_message_chain(:config_location).and_return('spec/fixtures/chef/knife.rb')
  end

  describe 'when knife.rb and knife-*.rb exist' do
    it 'returns a valid path for knife_config' do
      expect(knife_config).to eq('spec/fixtures/chef/knife.rb')
    end

    it 'returns a valid path for chef_dir' do
      expect(chef_dir).to eq('spec/fixtures/chef')
    end

    it 'returns available knife configs' do
      expect(available_configs).to eq(['spec/fixtures/chef/knife-org1.rb', 'spec/fixtures/chef/knife-org2.rb', 'spec/fixtures/chef/knife-org3.rb'])
    end

    it 'prints available configs' do
      expect { print_available_configs }.to output("available configs:\n * org1\n * org2\n * org3\n").to_stdout
    end

    it 'returns false when comparing different files' do
      expect(compare_configs('spec/fixtures/chef/knife-org1.rb','spec/fixtures/chef/knife-org2.rb')).to eq(false)
    end

    it 'returns true when comparing identical files' do
      expect(compare_configs('spec/fixtures/chef/knife-org2.rb','spec/fixtures/chef/knife-org3.rb')).to eq(true)
    end
  end

  describe 'when identical knife files exist' do
    it 'returns an array of configs' do
      expect { use_config('org2') }.to output("current[org2,org3]\n").to_stdout
    end
  end

  describe 'when trying to use an available org' do
    it 'uses a valid config file' do
      expect { use_config('org1') }.to output("current[org1]\n").to_stdout
    end
  end
end
