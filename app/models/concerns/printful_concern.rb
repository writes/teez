module PrintfulConcern extend ActiveSupport::Concern
  module ClassMethods
    @printfulApi = PrintfulClient.new(ENV['PRINTFUL_API_KEY'])

    def printful_api
      return @printfulApi
    end

    def spree_order_to_printful
      address = order.ship_address
      printful_order = {
        :recipient =>  {
          :name => address.firstname + " " + address.lastname,
          :address1 => address.address1,
          :city => address.city,
          :state_code => address.state_text,
          :country_code => address.country.iso,
          :zip => address.zipcode
        },
        :items => []
      }

      orderItems = order.line_items # get order items

      orderItems.each do |item|
        printful_order[:items].push({
          :variant_id => item.sku,
          :name => item.name,
          :retail_price => item.price.to_s,
          :quantity => item.quantity,
          :files => [{
            :url => 'http://example.com/files/posters/poster_1.jpg'
          }]
        })
      end

      printful_order
    end

    def get_printful_shipping(order)
      printful_order = self.spree_order_to_printful(order)

      res = self.printful_api.post('shipping/rates', printful_order)
      if (res.code === 200)
        require 'pp'
        pp res
        res.result
      end
    end

    def get_printful_tax(order)
      printful_order = {
        :recipient => self.spree_order_to_printful(order).recipient
      }

      # TODO add error handling
      res = self.printful_api.post('tax/rates', printful_order)
    end

    def submit_order_to_printful(order)
      printful_order = self.spree_order_to_printful(order)
      # TODO add error handling
      res = self.printful_api.post('orders', printful_order) #, {confirm: 1})
    end
    handle_asynchronously :submit_order_to_printful, :queue => 'printful_orders'

  end
end

