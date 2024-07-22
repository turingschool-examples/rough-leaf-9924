require 'rails_helper'

RSpec.describe "the supermarket show page" do
  before(:each) do 
    @customer1 = Customer.create!(name: "Beavis")
    @customer2 = Customer.create!(name: "Butthead")
    @customer3 = Customer.create!(name: "Daria")
    @customer4 = Customer.create!(name: "Mr. Anderson")

    @supermarket1 = Supermarket.create!(name: "Buc-ee's", location: "Highland, TX")
    @supermarket2 = Supermarket.create!(name: "ShopRite", location: "Austin, TX")

    @item1 = Item.create!(name: "Snickers Bar", price: 2, supermarket_id: @supermarket1.id)
    @item2 = Item.create!(name: "BBQ Chips", price: 4, supermarket_id: @supermarket1.id)
    @item3 = Item.create!(name: "Coffee", price: 6, supermarket_id: @supermarket1.id)
    @item4 = Item.create!(name: "Monster Energy", price: 5, supermarket_id: @supermarket1.id)

    @item5 = Item.create!(name: "Ice Cream", price: 9, supermarket_id: @supermarket2.id)
    @item6 = Item.create!(name: "Beer (Six-Pack)", price: 15, supermarket_id: @supermarket2.id)
    @item7 = Item.create!(name: "Hot Dog", price: 7, supermarket_id: @supermarket2.id)
    @item8 = Item.create!(name: "Pizza", price: 8, supermarket_id: @supermarket2.id)

    CustomerItem.create!(customer_id: @customer1.id, item_id: @item1.id)
    CustomerItem.create!(customer_id: @customer1.id, item_id: @item2.id)
    CustomerItem.create!(customer_id: @customer1.id, item_id: @item3.id)

    CustomerItem.create!(customer_id: @customer2.id, item_id: @item5.id)
    CustomerItem.create!(customer_id: @customer2.id, item_id: @item6.id)
    CustomerItem.create!(customer_id: @customer2.id, item_id: @item7.id)

    CustomerItem.create!(customer_id: @customer1.id, item_id: @item5.id)
    CustomerItem.create!(customer_id: @customer1.id, item_id: @item6.id)
    CustomerItem.create!(customer_id: @customer3.id, item_id: @item1.id)
    CustomerItem.create!(customer_id: @customer2.id, item_id: @item2.id)
  end

  # Extension
  it "shows a unique list of customers that shopped at a supermarket" do
    visit "/supermarkets/#{@supermarket1.id}"

    expect(page).to have_content(@customer1.name)
    expect(page).to have_content(@customer2.name)
    expect(page).to have_content(@customer3.name)
    expect(page).to_not have_content(@customer4.name)
  end

  it "shows a unique list of customers that shopped at another supermarket" do
    visit "/supermarkets/#{@supermarket2.id}"

    expect(page).to have_content(@customer1.name)
    expect(page).to have_content(@customer2.name)
    expect(page).to_not have_content(@customer3.name)
    expect(page).to_not have_content(@customer4.name)
  end
end
