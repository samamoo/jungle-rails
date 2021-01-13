require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
   #SETUP
   before :each do
    @category = Category.create! name: "Apparel"

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset("apparel1.jpg"),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see all products" do
    # ACT
    visit root_path
    # Find first product and click "Add" button
    first("article.product").find_button('Add').click
    puts "Finding the add button"
    # Check that the number increased in my cart
    # visit the cart page
    expect(page).to have_content "My Cart (1)" 
    puts "finding the My Cart link"
    find_link('My Cart (1)').click

    expect(page).to have_content "TOTAL:" 
    puts "Checking total is there"
    page.save_screenshot

  end
end
