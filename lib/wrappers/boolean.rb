module Wrappers
  class Boolean < Wrapper
    validate :is_boolean

    def convert
      String(original_value) == 'true'
    end

    def is_boolean
      stringified_value = String(value)
      unless stringified_value == 'true' || stringified_value == 'false'
        errors.add(:value, :not_a_boolean)
      end
    end
  end
end
