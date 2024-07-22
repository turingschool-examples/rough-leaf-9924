require 'rails_helper'

RSpec.describe 'Customer show page' do
  before :each do
    @supermarket = Supermarket.create(name: 'Safeway', location: 'Denver')

    @customer_1 = Customer.create(name: 'Joe')

    @item_1 = Item.create(name: 'Apple', price: 1, supermarket_id: @supermarket.id)
    @item_2 = Item.create(name: 'Banana', price: 2, supermarket_id: @supermarket.id)
    @item_3 = Item.create(name: 'Cereal', price: 3, supermarket_id: @supermarket.id)

    CustomerItem.create(customer_id: @customer_1.id, item_id: @item_1.id)
    CustomerItem.create(customer_id: @customer_1.id, item_id: @item_2.id)
  end
  
  it 'displays the customer name and the items they have purchased' do

    visit "/customers/#{@customer_1.id}"

    expect(page).to have_content(@customer_1.name)
    expect(page).to have_content(@item_1.name)
    expect(page).to have_content(@item_2.name)
    expect(page).to have_content(@item_1.price)
    expect(page).to have_content(@item_2.price)
  end

  it 'displays the Supermarket of the item listed' do
    visit "/customers/#{@customer_1.id}"

    within("#item-list") do
      expect(page).to have_content(@supermarket.name)
      expect(@supermarket.name).to eq('Safeway')
    end
  end

  describe 'add item to customer' do
    it 'displays a form to add an item to the customer' do
      visit "/customers/#{@customer_1.id}"

      within("#form-item") do
        expect(page).to have_field('item_id')
        expect(page).to have_button('Add Item')
      end
    end

    it 'can add an item to the customer' do
      visit "/customers/#{@customer_1.id}"

      fill_in 'item_id', with: @item_3.id
      click_button 'Add Item'

      expect(current_path).to eq("/customers/#{@customer_1.id}")
      
      within("#item-list") do
        expect(page).to have_content(@item_3.name)
        expect(page).to have_content(@item_3.price)
      end
    end
  end
end