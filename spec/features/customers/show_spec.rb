require 'rails_helper'

RSpec.describe "customers Show Page" do
 #User Story 1
  it "shows the customer's name and a lists of items" do
    @customer_1 = Customer.create!(name: "Billy")
    @supermarket_1 = Supermarket.create!(name: "Sals Super Market", location: "321 Grocery Grove")
    @item_1 = @supermarket_1.items.create!(name: "Beef", price: 5)
    @item_2 = @supermarket_1.items.create!(name: "Cheese", price: 3)
    @item_3 = @supermarket_1.items.create!(name: "Buns", price: 1)
    
    CustomerItem.create!(item_id: @item_1.id, customer_id: @customer_1.id)
    CustomerItem.create!(item_id: @item_3.id, customer_id: @customer_1.id)

    visit "/customers/#{@customer_1.id}"
    save_and_open_page
    expect(page).to have_content(@customer_1.name)
    expect(page).to have_content(@supermarket_1.name)
    expect(page).to have_content(@item_1.name)
    expect(page).to have_content(@item_1.price)
    expect(page).to have_content(@item_3.name)
    expect(page).to have_content(@item_3.price)
    expect(page).to_not have_content(@item_2.name)
    expect(page).to_not have_content(@item_2.price)

  end
end