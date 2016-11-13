module Spree
  module Calculator::Shipping
    class Printful < Spree::ShippingCalculator
      include PrintfulConcern

      def self.description
        Spree.t(:printful_shipping_calculator)
      end

      def compute_package(package)
        shipping = Spree::Calculator::Shipping::Printful.get_printful_shipping(package.order)
      end
    end
  end
end
