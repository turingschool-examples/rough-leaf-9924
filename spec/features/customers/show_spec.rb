require 'rails_helper'

RSpec.describe 'Customer show page', type: :feature do
  before(:each) do
    @supermarket = Supermarket.create!(name: 'Bizarre Bazaar', location: '999 Oddity Ln.')
    @customer = Customer.create!(name: 'Quirky Quinn')
    @item1 = @supermarket.items.create!(name: 'Dragon Fruit', price: 10)
    @item2 = @supermarket.items.create!(name: 'Phoenix Feather', price: 100)
    @item = @supermarket.items.create!(name: 'Unicorn Horn', price: 1000)
    @customer.items << [@item1, @item2]
    visit "/customers/#{@customer.id}"
  end
  # User Story 1, cutomer show page
  it 'shows the customer details' do
    expect(page).to have_content('Quirky Quinn')
  end

  it 'shows the names and prices of all items' do
    within 'ul.items' do
      expect(page).to have_content('Dragon Fruit')
      expect(page).to have_content('Phoenix Feather')
      expect(page).to have_content('$10')
      expect(page).to have_content('$100')
      expect(page).to have_content('Bizarre Bazaar')
    end
  end
  # User Story 2, adding an item to a customer
  it 'adds an item to the customer' do
    within '.add-item-form' do
      fill_in 'Item ID', with: @item.id
      click_button 'Add Item'
    end

    expect(current_path).to eq("/customers/#{@customer.id}")
    within 'ul.items' do
      expect(page).to have_content('Unicorn Horn')
    end
  end
end
