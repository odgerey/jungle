require 'rails_helper'

RSpec.feature "Visitor navigates to product detail page", type: :feature,  js: true do
 
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

  scenario "They see product details" do
    # ACT
    visit root_path
    first('.product').click_link('Details')

    # DEBUG
    save_screenshot('product_details.png')

    # VERIFY
    expect(page).to have_css '.products-show'
  end
end
