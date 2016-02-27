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

  describe '#valid?' do
    it 'adds a not_a_cidr error code to value if invalid' do
      cidr = described_class.new('256.256.0.0')
      expect(cidr).to be_invalid
      expect(cidr.errors[:value].join).to include 'not_a_cidr'
    end

    it 'is true for single IPs' do
      expect(described_class.new(Faker::Internet.ip_v4_address)).to be_valid
    end

    it 'is true for CIDR formatted subnet strings' do
      expect(described_class.new('1.0.0.0/8')).to be_valid
    end

    it 'is false for invalid IPs that may match simple regexes' do
      expect(described_class.new('256.1.1.1')).to be_invalid
    end

    it 'is true for positive integers' do
      expect(described_class.new(1)).to be_valid
    end

    it 'is true for 0' do
      expect(described_class.new(0)).to be_valid
    end

    describe 'corner cases' do
      invalid_example_data = [
        nil,
        '',
        true,
        false,
        -1,
        '-1',
        '0',
        '1',
        2**128 + 1]
      invalid_example_data.each do |example|
        it "is false for #{example}" do
          expect(described_class.new(example)).to be_invalid
        end
      end
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
