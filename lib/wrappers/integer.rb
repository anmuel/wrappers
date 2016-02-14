module Wrappers
  class Integer < Wrapper
    validates_numericality_of :value, only_integer: true

    def convert
      i = original_value.to_s
      if original_value && /\A\d+\z/.match(i)
        i.to_i
      else
        logger.debug("Could not convert #{original_value} to an Integer")
        nil
      end
    end
  end
end
