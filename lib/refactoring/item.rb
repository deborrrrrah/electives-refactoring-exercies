require './lib/refactoring/item_types/item_type.rb'

module Refactoring
  class Item
    attr_reader :name, :price, :type, :stock, :tags

    def initialize(type, name, price, stock, tags)
      type_valid = validate_type(type)
      tags_valid = validate_tags(type, tags)
      if type_valid and tags_valid
        @type = ItemType.create(type)
        @name = name
        @price = price
        @stock =  stock
        @tags = tags
      else
        raise ArgumentError
      end
    end

    def returnable?
      if ['BOOK', 'ELECTRONIC'].include?(@type)
        true
      else
        false
      end
    end

    def tax_in_percent
      @type.tax_in_percent
    end

    private
    def validate_type(type)
      ['BOOK', 'ELECTRONIC', 'FOOD', 'DRINK', 'SNACK'].include?(type)
    end

    def validate_tags(type, tags)
      case
      when type == 'BOOK'
        ['children', 'teen', 'adult', 'fiction', 'non-fiction'] & tags == tags
      when type == 'ELECTRONIC'
        ['household','office','hobby','sports'] & tags == tags
      when type == 'DRINK'
        ['dairy', 'vegetable', 'fruit', 'coffee', 'tea'] & tags == tags
      when ['FOOD', 'SNACK'].include?(type)
        ['meat', 'dairy', 'vegetable', 'fruit', 'pastry'] & tags == tags
      else false
      end
    end
  end
end
