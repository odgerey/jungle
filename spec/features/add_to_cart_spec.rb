require 'rails_helper'

RSpec.feature "User can add to cart", type: :feature,  js: true do
 
  # SETUP
  before :each do
    @category = Category.create! name: 'Instruments'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "The cart updates by one" do
    # ACT
    visit root_path
  
    expect(page).to have_text('My Cart (0)')
    product = page.first('article.product')
    button = product.find_button('Add')
    button.click 
    
    save_screenshot "ButtonClick.png"
    

    # # DEBUG
    # save_screenshot "add_to_cart.png"

    # # VERIFY
    expect(page).to have_content('My Cart (1)')
  end
end


