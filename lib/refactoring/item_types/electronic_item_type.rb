module Refactoring
  class ElectronicItemType
    def tags_valid?(tags)
      ['household','office','hobby','sports'] & tags == tags
    end

    def returnable?
      true
    end

    def tax_in_percent
      15
    end
  end
end