module Wrappers
  ##
  # Convenience Wrapper for CIDR (1.1.1.0/24) and IP (1.1.1.1) strings
  class Cidr < Wrapper
    validate :valid_cidr?

    def self.default_route?(cidr_string)
      new(cidr_string).default_route?
    end

    def convert
      cidr = NetAddr::CIDR.create(original_value)
      @valid = true
      cidr
    rescue ArgumentError, NetAddr::ValidationError => e
      logger.debug(e.message)
      @valid = false
      nil
    end

    def default_route?
      valid? && bits.zero?
    end

    private

    def valid_cidr?
      errors.add(:value, :not_a_cidr) unless @valid
    end
  end
end
