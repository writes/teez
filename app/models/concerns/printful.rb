module Printful extend ActiveSupport::Concern
  module ClassMethods
    @printfulApi = PrintfulClient.new(ENV['PRINTFUL_API_KEY'])

    def printful_api
      return @printfulApi
    end

    def submit_order_to_printful(order)
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

      # TODO add error handling
      res = self.printful_api.post('orders', order) #, {confirm: 1})
    end
    handle_asynchronously :submit_order_to_printful, :queue => 'printful_orders'
  end
end

