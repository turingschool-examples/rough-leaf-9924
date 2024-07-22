require 'rails_helper'

RSpec.describe 'Customer show page', type: :feature do
  before :each do
    @supermarket = Supermarket.create!(name: 'Corner Market', location: '123 Food St.')
    @customer1 = Customer.create!(name: 'Kaelin')
    @item1 = Item.create!(name: 'Banana', price: 1, supermarket: @supermarket)
    @item2 = Item.create!(name: 'Apple', price: 2, supermarket: @supermarket)
    
    @customer1.items << [@item1, @item2]
  end

  it 'shows the customer name and a list of their items with item details' do
    visit customer_path(@customer1)

    expect(page).to have_content(@customer1.name)
    expect(page).to have_content('Banana')
    expect(page).to have_content('$1')
    expect(page).to have_content('Corner Market')
    expect(page).to have_content('Apple')
    expect(page).to have_content('$2')
  end
end
