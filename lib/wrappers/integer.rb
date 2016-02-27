module Wrappers
  ##
  # Integer wrapper class
  class Integer < Wrapper
    validates_numericality_of :value, only_integer: true

    def convert
      ::Kernel::Integer(original_value)
    rescue ArgumentError, TypeError => e
      logger.debug(e.message)
      nil
    end
  end
end
