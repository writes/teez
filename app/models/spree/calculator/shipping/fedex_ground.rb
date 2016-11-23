module Spree
  module Calculator::Shipping
    class FedexGround < TeezShipping

      def self.description
        Spree.t(:fedex_ground)
      end

      def self.type
        'FEDEX_GROUND'
      end
    end
  end
end
