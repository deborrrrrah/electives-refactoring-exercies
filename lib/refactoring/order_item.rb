module Refactoring
  class OrderItem
    attr_reader :item, :quantity, :subtotal

    def initialize(item, quantity)
      if item.stock < quantity
        raise "Stock unavailable"
      else
        @item = item
        item.stock = item.stock - quantity
      end
      @subtotal = (item.price * quantity) + (item.price * item.tax_in_percent)
    end

    def cancel
      @item.stock = @item.stock + quantity
    end
  end
end
