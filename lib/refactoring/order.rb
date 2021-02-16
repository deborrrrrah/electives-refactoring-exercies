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

    def print_order_summary
      food_items = []
      drink_items = []
      snack_items = []
  
      order_items.each do |order_item|
        if order_item.food?
          food_items.append(order_item)
        elsif order_item.drink?
          drink_items.append(order_item)
        elsif order_item.snack?
          snack_items.append(order_item)
        else
          raise "item type#{order_item.item.type} is not supported"
        end
      end

      food_items_to_s_array = Array.new
      food_items.each do |food_item| 
        food_items_to_s_array << food_item.to_s
      end
      food_items_to_s = food_items_to_s_array.join("")

      drink_items_to_s_array = Array.new
      drink_items.each do |drink_item| 
        drink_items_to_s_array << drink_item.to_s
      end
      drink_items_to_s = drink_items_to_s_array.join("")

      snack_items_to_s_array = Array.new
      snack_items.each do |snack_item| 
        snack_items_to_s_array << snack_item.to_s
      end
      snack_items_to_s = snack_items_to_s_array.join("")

      "Food items:\n#{ food_items_to_s }Drink items:\n#{ drink_items_to_s }Snack items:\n#{ snack_items_to_s }"
    end
  end
end
