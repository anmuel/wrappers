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
end
