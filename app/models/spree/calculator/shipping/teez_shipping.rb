module Spree
  module Calculator::Shipping
    class TeezShipping < Printful

      def compute_package(package)
        shipments = super.compute_package(package)
        shipment = shipments.result.select {|result| result.id == self.type }
        shipment[0].rate
      end
    end
  end
end
