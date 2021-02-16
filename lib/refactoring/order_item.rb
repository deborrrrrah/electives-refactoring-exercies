module Refactoring
  class OrderItem
    attr_reader :item, :quantity

    def initialize(item, quantity)
      @item = item
      @quantity = quantity
    end

    def calculate_discount_price(rate)
      (@quantity * @item.price) * rate
    end

    def calculate_price(voucher)
      if voucher == true && @quantity > 2
        if @quantity > 10
          rate = 0.8
        elsif @quantity > 5
          rate = 0.9
        elsif @quantity > 2
          rate = 0.95
        end
        calculate_discount_price(rate)
      else
        @quantity * @item.price
      end
    end

    private :calculate_discount_price
  end
end
