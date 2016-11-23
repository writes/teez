module Spree
  module Calculator::Shipping
    class FedexStandardOvernight < TeezShipping

      def self.description
        Spree.t(:fedex_standard_overnight)
      end

      def self.type
        'FEDEX_STANDARD_OVERNIGHT'
      end
    end
  end
end
