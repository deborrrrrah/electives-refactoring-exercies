module Refactoring
  class FoodItemType
    def tags_valid?(tags)
      ['meat', 'dairy', 'vegetable', 'fruit', 'pastry'] & tags == tags
    end
    
    def returnable?
      false
    end
    
    def tax_in_percent
      5
    end
  end
end