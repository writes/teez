module Spree
  module Calculator::Shipping
    class Fedex2Day < TeezShipping

      def self.description
        Spree.t(:fedex_2_day)
      end

      def self.type
        'FEDEX_2_DAY'
      end
    end
  end
end
