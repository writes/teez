module Spree
  module Calculator::Shipping
    class FedexExpressSaver < TeezShipping

      def self.description
        Spree.t(:fedex_express_saver)
      end

      def self.type
        'FEDEX_EXPRESS_SAVER'
      end
    end
  end
end
