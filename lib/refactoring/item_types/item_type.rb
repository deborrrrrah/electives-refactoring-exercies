require './lib/refactoring/item_types/food_item_type.rb'
require './lib/refactoring/item_types/drink_item_type.rb'
require './lib/refactoring/item_types/snack_item_type.rb'
require './lib/refactoring/item_types/book_item_type.rb'
require './lib/refactoring/item_types/electronic_item_type.rb'

module Refactoring
  class ItemType
    def self.create(type)
      case type
      when "FOOD"
        return Refactoring::FoodItemType.new
      when "DRINK"
        return Refactoring::DrinkItemType.new
      when "SNACK"
        return Refactoring::SnackItemType.new
      when 'BOOK'
        return Refactoring::BookItemType.new
      when 'ELECTRONIC'
        return Refactoring::ElectronicItemType.new
      else
        raise "item type#{order_item.item.type} is not supported"
      end
    end
  end
end