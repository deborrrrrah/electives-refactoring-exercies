require 'spec_helper'

RSpec.describe Refactoring::OrderView do
  context 'when order items are initialize' do
    describe '#print_order_summary' do
      before(:each) do
        @items = [
          Refactoring::Item.new('BOOK', 'Handphone', 10000, 5, ['teen']),
          Refactoring::Item.new('ELECTRONIC', 'Handphone', 10000, 5, ['household']),
          Refactoring::Item.new('FOOD', 'Red Velvet', 20000, 10, ['pastry']),
          Refactoring::Item.new('DRINK', 'Lemonade', 5000, 10, ['tea']),
          Refactoring::Item.new('SNACK', 'Choco Pie', 20000, 10, ['pastry'])
        ]
        @order = Refactoring::Order.new
        @order.order_items << Refactoring::OrderItem.new(@items[2], 1)
        @order.order_items << Refactoring::OrderItem.new(@items[3], 2)
        @order.order_items << Refactoring::OrderItem.new(@items[4], 3)

        @order_view = Refactoring::OrderView.new(@order)
      end

      it 'return normal string' do
        expected = "Food items:\n1 Red VelvetDrink items:\n2 LemonadeSnack items:\n3 Choco Pie"
        expect(@order_view.print_order_summary).to eq(expected)
      end

      it 'raise RuntimeError when contains Book Item Type' do
        @order.order_items << Refactoring::OrderItem.new(@items[0], 4)
        expect{@order_view.print_order_summary}.to raise_error(RuntimeError)
      end

      it 'raise RuntimeError when contains Electronic Item Type' do
        @order.order_items << Refactoring::OrderItem.new(@items[1], 5)
        expect{@order_view.print_order_summary}.to raise_error(RuntimeError)
      end
    end
  end
end