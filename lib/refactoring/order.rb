require './lib/refactoring/order_view.rb'

module Refactoring
  class Order
    attr_accessor :order_items

    def initialize
      @order_items = Array.new
    end

    def calculate_price(voucher, delivery_cost, tax=0)
      price = 0
      order_items.each do |order_item|
        price += order_item.calculate_price(voucher)
      end
      price_after_tax = price + (tax * price)
      total_price = price_after_tax + delivery_cost
    end

    def food_items
      food_items = Array.new
      @order_items.each do |order_item|
        if order_item.food?
          food_items << order_item
        end
      end
      food_items
    end

    def drink_items
      drink_items = Array.new
      @order_items.each do |order_item|
        if order_item.drink?
          drink_items << order_item
        end
      end
      drink_items
    end

    def snack_items
      snack_items = Array.new
      @order_items.each do |order_item|
        if order_item.snack?
          snack_items << order_item
        end
      end
      snack_items
    end

    def other_items
      other_items = Array.new
      @order_items.each do |order_item|
        if !order_item.snack? && !order_item.food? && !order_item.drink?
          other_items << order_item
        end
      end
      other_items
    end
  end
end
