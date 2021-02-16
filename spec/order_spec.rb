require 'refactoring'

RSpec.describe Refactoring::Order do
  context 'when order items are initialize' do
    before(:all) do
      @order = Refactoring::Order.new
      @items = [
        Refactoring::Item.new('ELECTRONIC', 'Handphone', 10000, 5, ['household']),
        Refactoring::Item.new('FOOD', 'Red Velvet', 20000, 10, ['pastry'])
      ]
    end

    it "return when voucher is false, tax is 0.1, delivery_cost is 2000" do
      @order.order_items << Refactoring::OrderItem.new(@items[0], 2)
      @order.order_items << Refactoring::OrderItem.new(@items[1], 3)
      result = @order.calculate_price(false, 0.1, 2000)
      expect(result).to eq(90000)
    end

    it "return when voucher is true, tax is 0.1, delivery_cost is 2000" do
      @order.order_items << Refactoring::OrderItem.new(@items[0], 11)
      @order.order_items << Refactoring::OrderItem.new(@items[1], 6)
      result = @order.calculate_price(true, 0.1, 2000)
      expect(result).to eq(302300)
    end
  end
end