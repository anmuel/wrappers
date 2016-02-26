require 'spec_helper'

describe Wrappers::Boolean do
  describe '.try_convert' do
    it 'converts anything to false that is not true' do
      expect(described_class.try_convert(1)).to be false
      expect(described_class.try_convert(false)).to be false
      expect(described_class.try_convert('false')).to be false
      expect(described_class.try_convert(nil)).to be false
      expect(described_class.try_convert('')).to be false
      expect(described_class.try_convert(0)).to be false
    end

    it 'converts true as string to true' do
      expect(described_class.try_convert('true')).to be true
    end

    it 'converts true to true' do
      expect(described_class.try_convert(true)).to be true
    end
  end

  describe '#valid?' do
    it 'returns true if the input value is a real boolean' do
      expect(described_class.new(true)).to be_valid
    end

    it 'returns true if the input value is a stringly masked boolean' do
      expect(described_class.new('true')).to be_valid
    end

    it 'returns false for any other case' do
      expect(described_class.new(0)).to_not be_valid
    end
  end

  describe '#true?' do
    it 'returns true if the internal value is true' do
      expect(described_class.new(true)).to be_true
    end

    it 'returns false if the internal value is false' do
      expect(described_class.new(false)).to be_false
    end
  end

  describe '#false?' do
    it 'returns true if the internal value is false' do
      expect(described_class.new(true)).to_not be_false
    end

    it 'returns false if the internal value is true' do
      expect(described_class.new(false)).to be_false
    end
  end
end
