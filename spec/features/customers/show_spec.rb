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
 
 
  #User Story 1
  it "shows the customer's name and a lists of items" do
    
    visit "/customers/#{@customer_1.id}"
    
    expect(page).to have_content(@customer_1.name)
    expect(page).to have_content(@supermarket_1.name)
    expect(page).to have_content(@item_1.name)
    expect(page).to have_content(@item_1.price)
    expect(page).to have_content(@item_3.name)
    expect(page).to have_content(@item_3.price)
    expect(page).to_not have_content(@item_2.name)
    expect(page).to_not have_content(@item_2.price)
  end

  #User Story 2
  it "shows a form to add an item to the customer" do

    visit "/customers/#{@customer_1.id}"

    expect(page).to have_field("Item ID")
    expect(page).to have_button("Add Item")

    fill_in "Item ID", with: @item_2.id
    click_button "Add Item"

    expect(current_path).to eq "/customers/#{@customer_1.id}"

    expect(page).to have_content(@item_2.name)
    expect(page).to have_content(@item_2.price)
    expect(page).to_not have_content(@item_4.name)
    expect(page).to_not have_content(@item_4.price)
  end
end