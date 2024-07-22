require 'rails_helper'

RSpec.describe "customers Show Page" do
 before(:each) do
    @customer_1 = Customer.create!(name: "Billy")
    @supermarket_1 = Supermarket.create!(name: "Sals Super Market", location: "321 Grocery Grove")
    @item_1 = @supermarket_1.items.create!(name: "Beef", price: 5)
    @item_2 = @supermarket_1.items.create!(name: "Cheese", price: 3)
    @item_3 = @supermarket_1.items.create!(name: "Buns", price: 1)
    @item_4 = @supermarket_1.items.create!(name: "Cherries", price: 2)
    
    CustomerItem.create!(item_id: @item_1.id, customer_id: @customer_1.id)
    CustomerItem.create!(item_id: @item_3.id, customer_id: @customer_1.id)
 end

  #User Story 3
  it "shows a list of all items including the item's attributes with count of customer who purchased" do
    
    visit "/items"

    expect(page).to have_content(@supermarket_1.name)
    expect(page).to have_content(@item_1.name)
    expect(page).to have_content(@item_1.price)
    expect(page).to have_content(@item_1.customers_purchased)

    expect(page).to have_content(@supermarket_1.name)
    expect(page).to have_content(@item_2.name)
    expect(page).to have_content(@item_2.price)
    expect(page).to have_content(@item_2.customers_purchased)

    expect(page).to have_content(@supermarket_1.name)
    expect(page).to have_content(@item_3.name)
    expect(page).to have_content(@item_3.price)
    expect(page).to have_content(@item_3.customers_purchased)

    expect(page).to have_content(@supermarket_1.name)
    expect(page).to have_content(@item_4.name)
    expect(page).to have_content(@item_4.price)
    expect(page).to have_content(@item_4.customers_purchased)
  
  end



end
