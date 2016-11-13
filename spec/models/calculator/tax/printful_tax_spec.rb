require 'rails_helper'

describe Spree::Calculator::Tax::Printful do
  let(:calculator) { Spree::Calculator::Tax::Printful.new }
  let(:order) { FactoryGirl.create(:order_with_line_items)}

  before do
    rates = {
      :code => 200,
      :result => {
        :required => true,
        :rate => 0.09,
        :shipping_taxable => false
      }
    }
    allow(Spree::Calculator::Tax::Printful.printful_api).to receive(:post).and_return(rates)
  end

  it "should calculate shipping using printful" do
    calculated = calculator.compute(order)
    expect(calculated).to eq({})
  end
end

