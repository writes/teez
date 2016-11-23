module Spree
  module Calculator::Shipping
    class FedexSmartPost < TeezShipping

      def self.description
        Spree.t(:fedex_smart_post)
      end

      def self.type
        'FEDEX_SMART_POST'
      end
    end
  end
end
