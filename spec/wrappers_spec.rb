require 'spec_helper'

describe Wrappers do
  it 'has a version number' do
    expect(Wrappers::VERSION).not_to be nil
  end

  it 'provides an Integer shortcut method' do
    expect(Wrappers::Integer(1)).to eq 1
  end

  it 'provides a Boolean shortbut method' do
    expect(Wrappers::Boolean(true)).to be true
  end

  it 'provides a Cidr shortcut method' do
    expect(Wrappers::Cidr(false)).to be_nil
  end
end
