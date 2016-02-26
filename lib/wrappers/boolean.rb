module Wrappers
  class Boolean < Wrapper
    validate :boolean?

    def convert
      String(original_value) == 'true'
    end

    def boolean?
      stringified_value = String(original_value)
      unless stringified_value == 'true' || stringified_value == 'false'
        errors.add(:value, :not_a_boolean)
      end
    end

    def true?
      return value == true
    end

    def false?
      return value == false
    end
  end
end
