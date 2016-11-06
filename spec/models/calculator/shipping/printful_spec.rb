require 'rails_helper'

describe Spree::Calculator::Shipping::Printful do
  let(:calculator) { Spree::Calculator::Shipping::Printful.new }
  let(:order) { FactoryGirl.create(:order_with_line_items)}

  before do
  end

  it "should calculate shipping using printful" do
    calculated = calculator.compute_package(order)
    expect(calculated).to eq({})
  end
end

