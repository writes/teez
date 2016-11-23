module Spree
  module Calculator::Shipping
    class Standard < TeezShipping

      def self.description
        Spree.t(:standard)
      end

      def self.type
        'STANDARD'
      end
    end
  end
end
