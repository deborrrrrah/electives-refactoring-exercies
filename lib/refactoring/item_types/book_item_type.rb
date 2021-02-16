module Refactoring
  class BookItemType
    def tags_valid?(tags)
      ['children', 'teen', 'adult', 'fiction', 'non-fiction'] & tags == tags
    end

    def returnable?
      true
    end

    def tax_in_percent
      10
    end
  end
end