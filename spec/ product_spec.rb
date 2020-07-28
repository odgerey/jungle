require 'rails_helper'
RSpec.describe Product, type: :model do

  describe 'Validations' do
    it 'should save a valid product' do
      @category = Category.create(name:"Art")
      product = Product.new(
        name: "Mona Lisa",
        price: 1000000.00,
        quantity: 1,
        category_id: @category.id
        )
      expect(product).to (be_valid)
    end

    it 'should not save without valid name' do
      @category = Category.create(name: "Art")
      name = Product.new(
        name: nil,
        price: 1000000.00,
        quantity: 1,
        category_id: @category.id
        )
      expect(name).to_not (be_valid)
    end

    it 'should not save without valid price' do
      @category = Category.create(name: "Art")
      price = Product.new(
        name: "Mona Lisa",
        price: nil,
        quantity: 1,
        category_id: @category.id
        )
      expect(price).to_not (be_valid)
    end

    it 'should not save without valid quantity' do
      @category = Category.create(name: "Art")
      quantity = Product.new(
        name: "Mona Lisa",
        price: 1000000.00,
        quantity: nil,
        category_id: @category.id
        )
      expect(quantity).to_not (be_valid)
    end

    it 'should not save without valid category id' do
      @category = Category.create(name: "Art")
      category_id = Product.new(
        name: "Mona Lisa",
        price: 1000000.00,
        quantity: 1,
        category_id: nil
        )
      expect(category_id).to_not (be_valid)
    end
  end
end