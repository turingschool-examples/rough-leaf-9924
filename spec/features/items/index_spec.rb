require 'rails_helper'

RSpec.describe 'Item show page' do
  before :each do
    @supermarket = Supermarket.create(name: 'Safeway', location: 'Denver')

    @customer_1 = Customer.create(name: 'Joe')
    @customer_2 = Customer.create(name: 'Sally')

    @item_1 = Item.create(name: 'Apple', price: 1, supermarket_id: @supermarket.id)
    @item_2 = Item.create(name: 'Banana', price: 2, supermarket_id: @supermarket.id)
    @item_3 = Item.create(name: 'Cereal', price: 3, supermarket_id: @supermarket.id)

    CustomerItem.create(customer_id: @customer_1.id, item_id: @item_1.id)
    CustomerItem.create(customer_id: @customer_1.id, item_id: @item_2.id)
    CustomerItem.create(customer_id: @customer_1.id, item_id: @item_1.id)

    CustomerItem.create(customer_id: @customer_2.id, item_id: @item_2.id)
    CustomerItem.create(customer_id: @customer_2.id, item_id: @item_2.id)
    CustomerItem.create(customer_id: @customer_2.id, item_id: @item_2.id)
  end

  it 'I see a list of all items' do
    visit '/items'

    within("#main") do
      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@item_2.name)
      expect(page).to have_content(@item_3.name)
    end
  end

  it 'I see items name, price, and the supermarket where it is sold' do
    visit '/items'

    within("#main") do
      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@item_1.price)
      expect(page).to have_content(@supermarket.name)
    end
  end

  it 'I see the number of customers who have purchased each item. #number_sold' do
    visit '/items'

    within("#main") do
      expect(page).to have_content(@item_1.number_sold)
      expect(page).to have_content(@item_2.number_sold)
      expect(page).to have_content(@item_3.number_sold)

      expect(@item_1.number_sold).to eq(2)
      expect(@item_2.number_sold).to eq(4)
      expect(@item_3.number_sold).to eq(0)
    end
  end
end