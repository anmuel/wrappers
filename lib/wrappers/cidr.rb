module Wrappers
  class Cidr < Wrapper
    def convert
      begin
        NetAddr::CIDR.create(original_value)
      rescue ArgumentError => e
        logger.debug(e.message)
        nil
      end
    end
  end
end
