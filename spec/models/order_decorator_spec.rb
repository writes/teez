require 'rails_helper'

Delayed::Worker.delay_jobs = false

describe Spree::Order, type: :model do
  let(:order) { FactoryGirl.create(:order_with_line_items)}
  before do
    allow(order).to receive(:require_email)
    allow(Spree::Order.printful_api).to receive(:post)
  end

  context "when current state is confirm" do
    before do
      order.state = "confirm"
      allow(order).to receive_messages payment_required?: true
      allow(order).to receive_messages process_payments!: true
      allow(order).to receive_messages confirmation_delivered?: true
    end

    context "when payment processing succeeds" do
      before do
        order.payments << FactoryGirl.create(:payment, state: 'checkout', order: order)
      end

      it "should submit order to printful" do
        expect(Spree::Order).to receive(:submit_order_to_printful)
        order.next!
        expect(order.state).to eq('complete')
      end
    end
  end
end
