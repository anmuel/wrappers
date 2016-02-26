module Wrappers
  class Cidr < Wrapper
    validate :valid_cidr?

    def self.default_route?(cidr_string)
      new(cidr_string).default_route?
    end

    def convert
      begin
        cidr = NetAddr::CIDR.create(original_value)
        @valid = true
        cidr
      rescue ArgumentError, NetAddr::ValidationError => e
        logger.debug(e.message)
        @valid = false
        nil
      end
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
