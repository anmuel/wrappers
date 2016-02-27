##
# Wrapper superclass.
#
# Adds the SimpleDelegator and Validations functionality.
#
# Additionally provides access to logging methods.
class Wrapper < SimpleDelegator
  ##
  # The original input value without any conversion
  attr_reader :original_value

  ##
  # The input value after conversion
  attr_reader :value

  include ActiveModel::Validations

  # Convenience method to convert to input to the desired datatype
  # @return [Object] the converted value
  # @return [nil] if the input could not be converted
  def self.try_convert(input)
    new(input).value
  end

  def initialize(value)
    @original_value = value
    @value = convert
    super(@value)
  end

  def self.logger
    @logger ||= ::ActiveSupport::Logger.new(STDOUT)
  end

  def logger
    self.class.logger
  end
end
