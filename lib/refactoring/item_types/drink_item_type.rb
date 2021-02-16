module Refactoring
  class DrinkItemType
    def tags_valid?(tags)
      ['dairy', 'vegetable', 'fruit', 'coffee', 'tea'] & tags == tags
    end

    def returnable?
      false
    end
    
    def tax_in_percent
      5
    end
  end
end