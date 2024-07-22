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
    CustomerItem.create!(customer_id: @customer2.id, item_id: @item1.id)
    CustomerItem.create!(customer_id: @customer2.id, item_id: @item2.id)
  end

  # User Story 3
  it "displays a list of all items with their attributes and how many customers they belong to" do 
    visit "/items"

    within("#item-#{@item1.id}") do
      expect(page).to have_content("Item: #{@item1.name}")
      expect(page).to have_content("Price: $#{@item1.price}")
      expect(page).to have_content("Supermarket Name: #{@supermarket1.name}")
      expect(page).to have_content("Belongs to 2 Customers")
    end

    within("#item-#{@item2.id}") do
      expect(page).to have_content("Item: #{@item2.name}")
      expect(page).to have_content("Price: $#{@item2.price}")
      expect(page).to have_content("Supermarket Name: #{@supermarket1.name}")
      expect(page).to have_content("Belongs to 2 Customers")
    end

    within("#item-#{@item3.id}") do
      expect(page).to have_content("Item: #{@item3.name}")
      expect(page).to have_content("Price: $#{@item3.price}")
      expect(page).to have_content("Supermarket Name: #{@supermarket1.name}")
      expect(page).to have_content("Belongs to 1 Customer")
    end

    within("#item-#{@item4.id}") do
      expect(page).to have_content("Item: #{@item4.name}")
      expect(page).to have_content("Price: $#{@item4.price}")
      expect(page).to have_content("Supermarket Name: #{@supermarket1.name}")
      expect(page).to have_content("Belongs to 0 Customers")
    end

    within("#item-#{@item5.id}") do
      expect(page).to have_content("Item: #{@item5.name}")
      expect(page).to have_content("Price: $#{@item5.price}")
      expect(page).to have_content("Supermarket Name: #{@supermarket2.name}")
      expect(page).to have_content("Belongs to 2 Customers")
    end

    within("#item-#{@item6.id}") do
      expect(page).to have_content("Item: #{@item6.name}")
      expect(page).to have_content("Price: $#{@item6.price}")
      expect(page).to have_content("Supermarket Name: #{@supermarket2.name}")
      expect(page).to have_content("Belongs to 2 Customers")
    end

    within("#item-#{@item7.id}") do
      expect(page).to have_content("Item: #{@item7.name}")
      expect(page).to have_content("Price: $#{@item7.price}")
      expect(page).to have_content("Supermarket Name: #{@supermarket2.name}")
      expect(page).to have_content("Belongs to 1 Customer")
    end

    within("#item-#{@item8.id}") do
      expect(page).to have_content("Item: #{@item8.name}")
      expect(page).to have_content("Price: $#{@item8.price}")
      expect(page).to have_content("Supermarket Name: #{@supermarket2.name}")
      expect(page).to have_content("Belongs to 0 Customers")
    end
  end
end