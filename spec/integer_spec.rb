require 'spec_helper'

describe Wrappers::Integer do
  describe '.try_convert' do
    it 'converts an integer to an integer' do
      expect(described_class.try_convert(1)).to eq 1
    end

    it 'converts a string to an integer' do
      expect(described_class.try_convert('1')).to eq 1
    end

    it 'returns nil for a non-convertible value' do
      expect(described_class.try_convert(false)).to be_nil
    end
  end

  it 'acts like any other integer' do
    expect(described_class.new('1') + 1).to eq 2
  end

  it 'validates the value' do
    expect(described_class.new('1')).to be_valid
    expect(described_class.new(1)).to be_valid
    expect(described_class.new(false)).to be_invalid
    expect(described_class.new('123ba')).to be_invalid
    expect(described_class.new(nil)).to be_invalid
  end
end
