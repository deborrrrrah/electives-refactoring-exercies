module Refactoring
  class OrderView
    def initialize(order)
      @order = order
    end

    def items_array_to_s(items_array)
      items_array_to_s_array = Array.new
      items_array.each do |food_item| 
        items_array_to_s_array << food_item.to_s
      end
      items_array_to_s_array.join("")
    end

    def print_order_summary
      other_items = @order.other_items
      if other_items.length > 0
        raise "item type#{other_items[0].type} is not supported"
      end
      food_items_to_s = items_array_to_s(@order.food_items)
      drink_items_to_s = items_array_to_s(@order.drink_items)
      snack_items_to_s = items_array_to_s(@order.snack_items)
      "Food items:\n#{ food_items_to_s }Drink items:\n#{ drink_items_to_s }Snack items:\n#{ snack_items_to_s }"
    end

    private :items_array_to_s
  end
end
