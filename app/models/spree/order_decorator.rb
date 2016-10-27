Spree::Order.class_eval do
  require File.dirname(__FILE__) + '/printfulclient'
  require 'pp'

  def submit_order_to_printful(order)
    # TODO add error handling
    printful = PrintfulClient.new(ENV['PRINTFUL_API_KEY'])
    res = printful.post('orders', order) #, {confirm: 1})
  end
  handle_asynchronously :submit_order_to_printful, :queue => 'printful_orders'
end

Spree::Order.state_machine do
  after_transition :to => :complete do |order|
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

    order.submit_order_to_printful(printful_order)
  end
end

