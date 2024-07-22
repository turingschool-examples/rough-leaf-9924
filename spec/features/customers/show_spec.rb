require 'rails_helper'

RSpec.describe 'Customer show page', type: :feature do
  before(:each) do
    @supermarket = Supermarket.create!(name: 'Bizarre Bazaar', location: '999 Oddity Ln.')
    @customer = Customer.create!(name: 'Quirky Quinn')
    @item1 = @supermarket.items.create!(name: 'Dragon Fruit', price: 10)
    @item2 = @supermarket.items.create!(name: 'Phoenix Feather', price: 100)
    @customer.items << [@item1, @item2]
    visit "/customers/#{@customer.id}"
  end

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
end
