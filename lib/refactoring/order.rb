require './lib/refactoring/order_view.rb'
require './lib/refactoring/item_types/food_item_type.rb'
require './lib/refactoring/item_types/drink_item_type.rb'
require './lib/refactoring/item_types/snack_item_type.rb'

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

    def group_items_based_on(type)
      group_items = Array.new
      @order_items.each do |order_item|
        if order_item.is_type?(type)
          group_items << order_item
        end
      end
      group_items
    end

    def food_items
      group_items_based_on(FoodItemType)
    end

    def drink_items
      group_items_based_on(DrinkItemType)
    end

    def snack_items
      group_items_based_on(SnackItemType)
    end

    def other_items
      @order_items - food_items - drink_items - snack_items
    end

    private :group_items_based_on
  end
end
