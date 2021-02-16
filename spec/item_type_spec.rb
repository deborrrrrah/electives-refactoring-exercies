require 'spec_helper'

RSpec.describe Refactoring::ItemType do
  describe '.create' do
    it 'return FoodItemType' do
      type = 'FOOD'
      expect(described_class.create(type)).to be_a(Refactoring::FoodItemType)
    end

    it 'return DrinkItemType' do
      type = 'DRINK'
      expect(described_class.create(type)).to be_a(Refactoring::DrinkItemType)
    end

    it 'return SnackItemType' do
      type = 'SNACK'
      expect(described_class.create(type)).to be_a(Refactoring::SnackItemType)
    end

    it 'return ElectronicItemType' do
      type = 'ELECTRONIC'
      expect(described_class.create(type)).to be_a(Refactoring::ElectronicItemType)
    end

    it 'return BookItemType' do
      type = 'BOOK'
      expect(described_class.create(type)).to be_a(Refactoring::BookItemType)
    end

    it 'raise RuntimeError' do
      type = 'OTHER'
      expect{described_class.create(type)}.to raise_error(RuntimeError, 'item type OTHER is not supported')
    end
  end
end