require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

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

  scenario "Users can navigate from the home page to the product detail page by clicking on a product" do
    visit root_path
    expect(page).to have_css 'article.product', count: 10
    page.first('h4').click
    # save_and_open_screenshot
    expect(page).to have_css 'article.product-detail', count: 1
    # puts page.html
  end
    
end