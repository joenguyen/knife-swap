require 'chef/knife'
require 'chef/knife/swap'

describe Chef::Knife::Swap do
  before do
    config_loader = Chef::Knife.config_loader
    allow(config_loader).to receive_message_chain(:config_location).and_return('spec/fixtures/chef/knife.rb')
  end

  subject { described_class.new }

  describe 'when knife.rb and knife-*.rb exist' do
    it 'prints available configs when running swap command' do
      expect { subject.run }.to output("current[org1]\navailable configs:\n * org1\n * org2\n * org3\n").to_stdout
    end

    it 'fails when calling swap without a parameter' do
      subject.name_args = ['err']
      expect { subject.run }.to output("'err' is not a valid config.\ncurrent[org1]\navailable configs:\n * org1\n * org2\n * org3\n").to_stdout
    end

    it 'uses a valid config file called from swap' do
      subject.name_args = ['org1']
      expect { subject.run }.to output("current[org1]\n").to_stdout
    end
  end
end
