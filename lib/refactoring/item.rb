module Refactoring
  class Item
    attr_reader :name, :price, :type, :stock, :tags

    def initialize(type, name, price, stock, tags)
      type_valid = validate_type(type)
      tags_valid = validate_tags(type, tags)
      if type_valid and tags_valid
        @type = type
        @name = name
        @price = price
        @stock =  stock
        @tags = tags
      else
        raise ArgumentError
      end
    end

    def returnable?
      if ['book', 'electronic'].include?(@type)
        true
      else
        false
      end
    end

    def tax_in_percent
      case @type
      when 'book'
        10
      when 'food'
        5
      when 'electronic'
        15
      else 0
      end
    end

    private
    def validate_type(type)
      ['book', 'food', 'electronic'].include?(type)
    end

    def validate_tags(type, tags)
      case type
      when 'book'
        ['children', 'teen', 'adult', 'fiction', 'non-fiction'] & tags == tags
      when 'food'
        ['meat', 'dairy', 'vegetable', 'fruit', 'pastry'] & tags == tags
      when 'electronic'
        ['household','office','hobby','sports'] & tags == tags
      else false
      end
    end
  end
end
