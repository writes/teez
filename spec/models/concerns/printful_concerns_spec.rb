require 'rails_helper'

Delayed::Worker.delay_jobs = false
shared_examples_for "printful" do
  let(:model) { described_class } # the class that includes the concern
  let(:order) { FactoryGirl.create(:order_with_line_items)}

  context "concerns" do
    before do
      allow(model.printful_api).to receive(:post)
    end

    describe "submit_order_to_printful" do
      it "should submit order to printful" do
        expect(model.printful_api).to receive(:post)
        model.submit_order_to_printful(order);
      end
    end

    describe "get_printful_shipping" do
      it "should get shipping info from printful" do
        expect(model.printful_api).to receive(:post)
        model.get_printful_shipping(order);
      end
    end

    describe "get_printful_tax" do
      it "should get tax rate from printful" do
        expect(model.printful_api).to receive(:post)
        model.get_printful_tax(order);
      end
    end

    describe "spree_order_to_printful" do
      it "should parse spree order to printful order" do
        printful_order = model.spree_order_to_printful(order);
        expect(printful_order).to eq({})
      end
    end
  end
end
