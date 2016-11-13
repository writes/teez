module Spree
  module Calculator::Tax
    class Printful < Spree::Calculator
      include PrintfulConcern

      def self.description
        Spree.t(:printful_tax_calculator)
      end

      def compute(object=nil)
        tax = Spree::Calculator::Tax::Printful.get_printful_shipping(package)
        {}
      end
    end
  end
end
