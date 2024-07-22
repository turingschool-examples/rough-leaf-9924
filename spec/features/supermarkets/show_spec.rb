require 'rails_helper'

RSpec.describe 'Supermarket show page' do
  before :each do
    @supermarket_1 = Supermarket.create(name: 'Safeway', location: 'Denver')
    @supermarket_2 = Supermarket.create(name: 'King Soopers', location: 'Denver')

    @customer_1 = Customer.create(name: 'Joe')
    @customer_2 = Customer.create(name: 'Sally')
    
    #safeway
    @item_1 = Item.create(name: 'Apple', price: 1, supermarket_id: @supermarket_1.id)
    @item_2 = Item.create(name: 'Banana', price: 2, supermarket_id: @supermarket_1.id)
    @item_3 = Item.create(name: 'Cereal', price: 3, supermarket_id: @supermarket_1.id)
    #soopers
    @item_4 = Item.create(name: 'Apple', price: 1, supermarket_id: @supermarket_2.id)
    @item_5 = Item.create(name: 'Banana', price: 2, supermarket_id: @supermarket_2.id)
    @item_6 = Item.create(name: 'Cereal', price: 3, supermarket_id: @supermarket_2.id)

    CustomerItem.create(customer_id: @customer_1.id, item_id: @item_1.id)
    CustomerItem.create(customer_id: @customer_1.id, item_id: @item_2.id)
    CustomerItem.create(customer_id: @customer_1.id, item_id: @item_1.id)

    CustomerItem.create(customer_id: @customer_2.id, item_id: @item_4.id)
    CustomerItem.create(customer_id: @customer_2.id, item_id: @item_5.id)
    CustomerItem.create(customer_id: @customer_2.id, item_id: @item_6.id)
  end

  it 'I see a unique list of all customers that have shopped at the supermarket' do
    
    #Safeway
    visit "/supermarkets/#{@supermarket_1.id}"

    expect(page).to have_content(@supermarket_1.name)
    
    within "#supermarket-customers" do
      expect(page).to have_content(@customer_1.name)
      expect(page).to_not have_content(@customer_2.name)
    end

    #King Soopers
    visit "/supermarkets/#{@supermarket_2.id}"

    expect(page).to have_content(@supermarket_2.name)

    within "#supermarket-customers" do
      expect(page).to have_content(@customer_2.name)
      expect(page).to_not have_content(@customer_1.name)
    end
  end
end