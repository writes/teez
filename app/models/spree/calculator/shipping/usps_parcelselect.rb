module Spree
  module Calculator::Shipping
    class UspsParcelselect < TeezShipping

      def self.description
        Spree.t(:usps_parcelselect)
      end

      def self.type
        'USPS_PARCELSELECT'
      end
    end
  end
end
