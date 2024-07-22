require 'rails_helper'

RSpec.describe "the customer show page" do
  before(:each) do 
    @customer1 = Customer.create!(name: "Beavis")
    @customer2 = Customer.create!(name: "Butthead")

    @supermarket1 = Supermarket.create!(name: "Buc-ee's", location: "Highland, TX")
    @supermarket2 = Supermarket.create!(name: "ShopRite", location: "Austin, TX")

    @item1 = Item.create!(name: "Snickers Bar", price: 2, supermarket_id: @supermarket1.id)
    @item2 = Item.create!(name: "BBQ Chips", price: 4, supermarket_id: @supermarket1.id)
    @item3 = Item.create!(name: "Coffee", price: 6, supermarket_id: @supermarket1.id)
    @item4 = Item.create!(name: "Monster Energy", price: 5, supermarket_id: @supermarket1.id)

    @item5 = Item.create!(name: "Ice Cream", price: 9, supermarket_id: @supermarket2.id)
    @item6 = Item.create!(name: "Beer (6 Pack)", price: 15, supermarket_id: @supermarket2.id)
    @item7 = Item.create!(name: "Hot Dog", price: 7, supermarket_id: @supermarket2.id)
    @item8 = Item.create!(name: "Pizza", price: 8, supermarket_id: @supermarket2.id)

    CustomerItem.create!(customer_id: @customer1.id, item_id: @item1.id)
    CustomerItem.create!(customer_id: @customer1.id, item_id: @item2.id)
    CustomerItem.create!(customer_id: @customer1.id, item_id: @item3.id)

    CustomerItem.create!(customer_id: @customer2.id, item_id: @item5.id)
    CustomerItem.create!(customer_id: @customer2.id, item_id: @item6.id)
    CustomerItem.create!(customer_id: @customer2.id, item_id: @item7.id)
  end

  # User Story 1
  it "displays the customer's name and a list of their items and all their attributes" do 
    visit "/customers/#{@customer1.id}"

    expect(page).to have_content(@customer1.name)

    within("#item-#{@item1.id}") do
      expect(page).to have_content(@item1.name)
      expect(page).to have_content(@item1.price)
      expect(page).to have_content(@supermarket1.name)
    end

    within("#item-#{@item2.id}") do
      expect(page).to have_content(@item2.name)
      expect(page).to have_content(@item2.price)
      expect(page).to have_content(@supermarket1.name)
    end

    within("#item-#{@item3.id}") do
      expect(page).to have_content(@item3.name)
      expect(page).to have_content(@item3.price)
      expect(page).to have_content(@supermarket1.name)
    end

    expect(page).to_not have_content(@customer2.name)

    expect(page).to_not have_content(@item5.name)
    expect(page).to_not have_content(@item5.price)
    expect(page).to_not have_content(@item6.name)
    expect(page).to_not have_content(@item6.price)
    expect(page).to_not have_content(@item7.name)
    expect(page).to_not have_content(@item7.price)

    expect(page).to_not have_content(@supermarket2.name)
  end
end