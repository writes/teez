module Spree
  module Calculator::Shipping
    class Printful < Spree::ShippingCalculator
      def self.description
        # Human readable description of the calculator
      end

      def compute_package(package)
        # Returns the value after performing the required calculation
        {}
      end
    end
  end
end
