require "wrappers/version"
require 'wrappers/dependencies'
require 'wrappers/wrapper'
require 'wrappers/integer'
require 'wrappers/cidr'
require 'wrappers/boolean'

module Wrappers
  def self.Integer(value)
    Integer.try_convert(value)
  end

  def self.Boolean(value)
    Boolean.try_convert(value)
  end

  def self.Cidr(value)
    Cidr.try_convert(value)
  end
end
