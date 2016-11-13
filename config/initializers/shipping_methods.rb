config = Rails.application.config
config.after_initialize do
  config.spree.calculators.shipping_methods << Spree::Calculator::Shipping::Printful
  config.spree.calculators.tax_rates << Spree::Calculator::Tax::Printful
end

