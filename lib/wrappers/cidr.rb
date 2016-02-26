module Wrappers
  class Cidr < Wrapper
    def self.default_route?(cidr_string)
      new(cidr_string).default_route?
    end

    def convert
      begin
        NetAddr::CIDR.create(original_value)
      rescue ArgumentError => e
        logger.debug(e.message)
        nil
      end
    end

    def default_route?
      valid? && bits.zero?
    end
  end
end
