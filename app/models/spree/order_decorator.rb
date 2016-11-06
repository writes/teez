Spree::Order.class_eval do
  include Printful

  state_machine.after_transition :to => :complete do |order|
    Spree::Order.submit_order_to_printful(order)
  end
end


