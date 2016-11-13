require 'rails_helper'

describe Spree::Calculator::Shipping::Printful do
  let(:calculator) { Spree::Calculator::Shipping::Printful.new }
  let(:order) { FactoryGirl.create(:order_with_line_items)}

  before do
    shipping_rates = {
      :code => 200,
      :result => {
        :required => true,
        :rate => 0.09,
        :shipping_taxable => false
      }
    }
    allow(Spree::Calculator::Shipping::Printful.printful_api).to receive(:post).and_return(shipping_rates)
  end

  it "should calculate shipping using printful" do
    expect(Spree::Calculator::Shipping::Printful).to receive(:get_printful_shipping)
    rate = calculator.compute_package(package)
    expect(rate).to eq(0.09)
  end
end

