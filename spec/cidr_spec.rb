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
end
