module Refactoring
  class OrderItem
    attr_reader :item, :quantity
    def initialize(item, quantity)
      @item = item
      @quantity = quantity
    end
  end
end
