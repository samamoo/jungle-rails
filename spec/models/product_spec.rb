require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # before(:each) do
    #   @category = Category.create! name: 'Shoes'
    #   @product = @category.product.create!(
    #     name: 'Scarpa Instincts',
    #     description: ' aggressive shoes',
    #     price: 500,
    #     image:'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSYfhzyWPPtBGI9HhMIRItB87z7lj4DpI6HIlH1wA09xgVQ_S3cp17MZ6II17cf_fJKIdHphG8dVDiZ&usqp=CAc',
    #     quantity: 4
    #   )
    # end

    it 'should save a product with all validations passing' do
      @category = Category.create! name: 'Shoes'
      @product = @category.products.create!(
        name: 'Scarpa Instincts',
        description: ' aggressive shoes',
        price: 500,
        image:'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSYfhzyWPPtBGI9HhMIRItB87z7lj4DpI6HIlH1wA09xgVQ_S3cp17MZ6II17cf_fJKIdHphG8dVDiZ&usqp=CAc',
        quantity: 4
      )

      expect(@product.name).to be_present
      expect(@product.quantity).to be_present
      expect(@product.price).to be_present
      expect(@product.category_id).to be_present
    end

    # PRICE
    it 'should validate the price is present' do
      @category = Category.create! name: 'Shoes'
      @product = @category.products.create(
        name: 'Scarpa Instincts',
        description: ' aggressive shoes',
        image:'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSYfhzyWPPtBGI9HhMIRItB87z7lj4DpI6HIlH1wA09xgVQ_S3cp17MZ6II17cf_fJKIdHphG8dVDiZ&usqp=CAc',
        quantity: 4
      )
      @product.errors.full_messages.each do |message|
        puts message
      end

      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    # QUANTITY
    it 'should validate the quantity is present' do
      @category = Category.create! name: 'Shoes'
      @product = @category.products.create(
        name: 'Scarpa Instincts',
        description: ' aggressive shoes',
        price: 300,
        image:'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSYfhzyWPPtBGI9HhMIRItB87z7lj4DpI6HIlH1wA09xgVQ_S3cp17MZ6II17cf_fJKIdHphG8dVDiZ&usqp=CAc',
      )
      @product.errors.full_messages.each do |message|
        puts message
      end

      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    # NAME - checking error messages
    it 'should validate the name is present' do
      @category = Category.create! name: 'Shoes'
      @product = @category.products.create(
        name: '',
        description: ' aggressive shoes',
        price: 300,
        image:'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSYfhzyWPPtBGI9HhMIRItB87z7lj4DpI6HIlH1wA09xgVQ_S3cp17MZ6II17cf_fJKIdHphG8dVDiZ&usqp=CAc',
        quantity: 4
      )
      @product.errors.full_messages.each do |message|
        puts message
      end

      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    # CATEGORY ID
    it 'should validate the category id is present' do
      @category = Category.create! name: 'Shoes'
      @product = @category.products.create(
        name: 'Scarpa Instincts',
        description: ' aggressive shoes',
        price: 300,
        image:'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSYfhzyWPPtBGI9HhMIRItB87z7lj4DpI6HIlH1wA09xgVQ_S3cp17MZ6II17cf_fJKIdHphG8dVDiZ&usqp=CAc',
        quantity: 4
      )

      expect(@product.category_id).to be_a(Integer)
    end

  end
end
