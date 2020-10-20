require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it "validates a new product" do
      @category = Category.new(name: "Testing")
      @product = Product.new(name: "Cannondale Road Bike", price: 7500, quantity: 5, category: @category)
      @product.save!
      expect(@product).to be_valid
    end

    it "shouldn't validate a product without a name" do
      @category = Category.new(name: "Testing")
      @product = Product.new(name: nil, price: 7500, quantity: 5, category: @category)
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "shouldn't validate a product without a price" do
      @category = Category.new(name: "Testing")
      @product = Product.new(name: "Cannondale Road Bike", price: nil, quantity: 5, category: @category)
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "shouldn't validate a product without a quantity" do
      @category = Category.new(name: "Testing")
      @product = Product.new(name: "Cannondale Road Bike", price: 7500, quantity: nil, category: @category)
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")     
    end

    it "shouldn't validate a product without a category" do
      @category = Category.new(name: "Testing")
      @product = Product.new(name: "Cannondale Road Bike", price: 7500, quantity: 5, category: nil)
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")     
    end
  end
end
