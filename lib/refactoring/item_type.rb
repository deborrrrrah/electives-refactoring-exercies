# require './lib/refactoring/food_item.rb'
# require './lib/refactoring/drink_item.rb'
# require './lib/refactoring/snack_item.rb'
# require './lib/refactoring/book_item.rb'
# require './lib/refactoring/electronic_item.rb'

module Refactoring
  class ItemType
    def self.create(type)
      case type
      when "FOOD"
        return FoodItemType.new
      when "DRINK"
        return DrinkItemType.new
      when "SNACK"
        return SnackItemType.new
      when 'BOOK'
        return BookItemType.new
      when 'ELECTRONIC'
        return ElectronicItemType.new
      else
        raise "item type#{order_item.item.type} is not supported"
      end
    end
  end

  class BookItemType < ItemType
    def tax_in_percent
      10
    end
  end

  class DrinkItemType < ItemType
    def tax_in_percent
      5
    end
  end

  class FoodItemType < ItemType
    def tax_in_percent
      5
    end
  end

  class ElectronicItemType < ItemType
    def tax_in_percent
      15
    end
  end

  class SnackItemType < ItemType
    def tax_in_percent
      5
    end
  end
end