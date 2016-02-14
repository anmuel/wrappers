class Wrapper < SimpleDelegator
  attr_reader :original_value,
              :value

  include ActiveModel::Validations

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
