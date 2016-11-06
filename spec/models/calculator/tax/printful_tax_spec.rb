require 'rails_helper'

describe Spree::Calculator::Tax::Printful do
  let(:calculator) { Spree::Calculator::Tax::Printful.new }
  let(:order) { FactoryGirl.create(:order_with_line_items)}

  before do
  end

  it "should calculate shipping using printful" do
    calculated = calculator.compute(order)
    expect(calculated).to eq({})
  end
end

