require 'spec_helper'

describe Wrappers::Cidr do
  describe '.try_convert' do
    it 'converts a cidr formatted string to a CIDR class' do
      netmask = rand(0..24).to_i
      ip = Faker::Internet.ip_v4_address
      cidr_string = "#{ip}/#{netmask}"
      cidr = described_class.try_convert(cidr_string)
      expect(cidr).to be
      expect(cidr.ip).to eq ip
      expect(cidr.netmask).to eq "/#{netmask}"
    end

    it 'returns nil if the input does not contain a cidr formatted string' do
      expect(described_class.try_convert(false)).to be_nil
    end
  end

  describe '.default_route?' do
    it 'returns true if the subnet prefix is 0' do
      expect(described_class.default_route?('0.0.0.0/0')).to be true
    end

    it 'returns false for any other case' do
      expect(described_class.default_route?('1.1.1.1/24')).to be false
    end
  end

  describe '#default_route?' do
    it 'returns true if the subnet prefix of the internal value is 0' do
      expect(described_class.new('0.0.0.0/0')).to be_default_route
    end

    it 'returns false for any other case' do
      expect(described_class.new('1.1.1.1/24')).to_not be_default_route
    end
  end
end
