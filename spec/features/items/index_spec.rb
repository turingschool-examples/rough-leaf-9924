require 'rails_helper'
#User Story 3, items index page
RSpec.describe 'Items index page', type: :feature do
  before(:each) do
    @supermarket = Supermarket.create!(name: 'Weird Warehouse', location: '123 Fun St.')
    @item1 = @supermarket.items.create!(name: 'Goblin Toenail', price: 15)
    @item2 = @supermarket.items.create!(name: 'Troll Hair', price: 25)
    @customer1 = Customer.create!(name: 'Bob')
    @customer2 = Customer.create!(name: 'Oliver')

    @customer1.items << @item1
    @customer2.items << @item1
    @customer1.items << @item2
    visit '/items'
  end

  it 'shows a list of all items with their details and customer count' do
    within 'ul.items' do
      expect(page).to have_content('Goblin Toenail')
      expect(page).to have_content('$15')
      expect(page).to have_content('Weird Warehouse')
      expect(page).to have_content('Customers: 2')

      expect(page).to have_content('Troll Hair')
      expect(page).to have_content('$25')
      expect(page).to have_content('Weird Warehouse')
      expect(page).to have_content('Customers: 1')
    end
  end
end