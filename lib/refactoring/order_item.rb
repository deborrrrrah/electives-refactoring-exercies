module Refactoring
  class OrderItem
    attr_reader :item, :quantity

    def initialize(item, quantity)
      @item = item
      @quantity = quantity
    end

    def calculate_price(voucher)
      if voucher == true
        if @quantity > 10
          price = (@quantity * @item.price) * 0.8
        elsif @quantity > 5
          price = (@quantity * @item.price) * 0.9
        elsif @quantity > 2
          price = (@quantity * @item.price) * 0.95
        else
          price = @quantity * @item.price
        end
      else
        price = @quantity * @item.price
      end
      price
    end
  end
end
