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
    first('.product').click_on('Add')

    # DEBUG
    save_screenshot "add_to_cart.png"

    # VERIFY
    within ('nav') { expect(page).to have_content ('My Cart (0)') }
  end
end


