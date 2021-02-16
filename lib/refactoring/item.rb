require './lib/refactoring/item_types/item_type.rb'

module Refactoring
  class Item
    attr_reader :name, :price, :type, :stock, :tags

    def initialize(type, name, price, stock, tags)
      @type = ItemType.create(type)
      if @type.tags_valid?(tags)
        @name = name
        @price = price
        @stock =  stock
        @tags = tags
      else
        raise ArgumentError
      end
    end

    def returnable?
      @type.returnable?
    end

    def tax_in_percent
      @type.tax_in_percent
    end
  end
end
