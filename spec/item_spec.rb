require 'spec_helper'

RSpec.describe Refactoring::Item do
  context 'when items are initialize' do
    before(:all) do
      @items = [
        Refactoring::Item.new('BOOK', 'Handphone', 10000, 5, ['teen']),
        Refactoring::Item.new('ELECTRONIC', 'Handphone', 10000, 5, ['household']),
        Refactoring::Item.new('FOOD', 'Red Velvet', 20000, 10, ['pastry']),
        Refactoring::Item.new('DRINK', 'Lemonade', 5000, 10, ['tea']),
        Refactoring::Item.new('SNACK', 'Choco Pie', 20000, 10, ['pastry'])
      ]
    end

    describe '#initialize' do
      it 'raise ArgumentError' do
        expect{described_class.new('BOOK', 'Handphone', 10000, 5, ['household'])}.to raise_error(ArgumentError)
      end
    end

    describe '#tax_in_percent' do
      it "return 10 when item is Book" do
        result = @items[0].tax_in_percent
        expect(result).to eq(10)
      end

      it "return 15 when item is Electronic" do
        result = @items[1].tax_in_percent
        expect(result).to eq(15)
      end

      it "return 5 when item is Food" do
        result = @items[2].tax_in_percent
        expect(result).to eq(5)
      end

      it "return 5 when item is Drink" do
        result = @items[3].tax_in_percent
        expect(result).to eq(5)
      end

      it "return 5 when item is Snack" do
        result = @items[4].tax_in_percent
        expect(result).to eq(5)
      end
    end

    describe '#returnable?' do
      it "return true when item is Book" do
        result = @items[0].returnable?
        expect(result).to eq(true)
      end

      it "return true when item is Electronic" do
        result = @items[1].returnable?
        expect(result).to eq(true)
      end

      it "return false when item is Food" do
        result = @items[2].returnable?
        expect(result).to eq(false)
      end

      it "return false when item is Drink" do
        result = @items[3].returnable?
        expect(result).to eq(false)
      end

      it "return false when item is Snack" do
        result = @items[4].returnable?
        expect(result).to eq(false)
      end
    end
  end
end