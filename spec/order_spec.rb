require 'spec_helper'

RSpec.describe Refactoring::Order do
  context 'when order items are initialize' do
    describe '#calculate_price' do
      before(:each) do
        @order = Refactoring::Order.new
        @items = [
          Refactoring::Item.new('ELECTRONIC', 'Handphone', 10000, 5, ['household']),
          Refactoring::Item.new('FOOD', 'Red Velvet', 20000, 10, ['pastry'])
        ]
      end

      it "return 90000 when voucher is false, tax is 0.1, delivery_cost is 2000" do
        @order.order_items << Refactoring::OrderItem.new(@items[0], 2)
        @order.order_items << Refactoring::OrderItem.new(@items[1], 3)
        result = @order.calculate_price(false, 2000, 0.1)
        expect(result).to eq(90000)
      end

      it "return 217600 when voucher is true, tax is 0.1, delivery_cost is 2000" do
        @order.order_items << Refactoring::OrderItem.new(@items[0], 11)
        @order.order_items << Refactoring::OrderItem.new(@items[1], 6)
        result = @order.calculate_price(true, 2000, 0.1)
        expect(result).to eq(217600)
      end

      it "return 33350 when voucher is true, tax is 0.1, delivery_cost is 2000" do
        @order.order_items << Refactoring::OrderItem.new(@items[0], 3)
        result = @order.calculate_price(true, 2000, 0.1)
        expect(result).to eq(33350)
      end

      it "return 198000 when voucher is true, tax is not defined, delivery_cost is 2000" do
        @order.order_items << Refactoring::OrderItem.new(@items[0], 11)
        @order.order_items << Refactoring::OrderItem.new(@items[1], 6)
        result = @order.calculate_price(true, 2000)
        expect(result).to eq(198000)
      end
    end
  end
end