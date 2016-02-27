module Wrappers
  ##
  # Convenience Wrapper for Booleans. Can treat true Boolean values such as
  # true and false, and stringly typed booleans such as 'true' and 'false'
  class Boolean < Wrapper
    validate :boolean?

    def convert
      String(original_value) == 'true'
    end

    ##
    # @return [True|False] if the internal value is true
    def true?
      value == true
    end

    ##
    # @return [True|False] if the interal value is false
    def false?
      value == false
    end

    private

    def boolean?
      stringified_value = String(original_value)
      unless stringified_value == 'true' || stringified_value == 'false'
        errors.add(:value, :not_a_boolean)
      end
    end
  end
end
