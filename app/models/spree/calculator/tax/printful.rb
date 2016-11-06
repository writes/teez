module Spree
  module Calculator::Tax
    class Printful < Spree::Calculator
      def self.description
        # Human readable description of the calculator
      end

      def compute(object=nil)
        # Returns the value after performing the required calculation
        {}
      end
    end
  end
end
