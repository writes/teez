module Spree
  module Calculator::Shipping
    class UspsPriority < TeezShipping

      def self.description
        Spree.t(:usps_priority)
      end

      def self.type
        'USPS_PRIORITY'
      end
    end
  end
end
