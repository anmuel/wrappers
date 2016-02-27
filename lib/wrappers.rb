require 'wrappers/version'
require 'wrappers/dependencies'
require 'wrappers/wrapper'
require 'wrappers/integer'
require 'wrappers/cidr'
require 'wrappers/boolean'

module Wrappers
  ##
  # Shorthand method to access Integer conversion
  # @see Integer
  def self.Integer(value)
    Integer.try_convert(value)
  end

  ##
  # Shorthand method to access Boolean conversion
  def self.Boolean(value)
    Boolean.try_convert(value)
  end

  ##
  # Shorthand method to access Cidr conversion
  def self.Cidr(value)
    Cidr.try_convert(value)
  end
end
