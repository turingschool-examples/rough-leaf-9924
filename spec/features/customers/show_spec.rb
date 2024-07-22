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
  end

  # User Story 1
  it "displays the customer's name and a list of their items and all their attributes" do 
    visit "/customers/#{@customer1.id}"

    expect(page).to have_content(@customer1.name)

    within("#item-#{@item1.id}") do
      expect(page).to have_content("Item: #{@item1.name}")
      expect(page).to have_content("Price: $#{@item1.price}")
      expect(page).to have_content("Supermarket Name: #{@supermarket1.name}")
    end

    within("#item-#{@item2.id}") do
      expect(page).to have_content("Item: #{@item2.name}")
      expect(page).to have_content("Price: $#{@item2.price}")
      expect(page).to have_content("Supermarket Name: #{@supermarket1.name}")
    end

    within("#item-#{@item3.id}") do
      expect(page).to have_content("Item: #{@item3.name}")
      expect(page).to have_content("Price: $#{@item3.price}")
      expect(page).to have_content("Supermarket Name: #{@supermarket1.name}")
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

  it "displays another customer's name and a list of their items and all their attributes" do 
    visit "/customers/#{@customer2.id}"

    expect(page).to have_content(@customer2.name)

    within("#item-#{@item5.id}") do
      expect(page).to have_content("Item: #{@item5.name}")
      expect(page).to have_content("Price: $#{@item5.price}")
      expect(page).to have_content("Supermarket Name: #{@supermarket2.name}")
    end

    within("#item-#{@item6.id}") do
      expect(page).to have_content("Item: #{@item6.name}")
      expect(page).to have_content("Price: $#{@item6.price}")
      expect(page).to have_content("Supermarket Name: #{@supermarket2.name}")
    end

    within("#item-#{@item7.id}") do
      expect(page).to have_content("Item: #{@item7.name}")
      expect(page).to have_content("Price: $#{@item7.price}")
      expect(page).to have_content("Supermarket Name: #{@supermarket2.name}")
    end

    expect(page).to_not have_content(@customer1.name)

    expect(page).to_not have_content(@item1.name)
    expect(page).to_not have_content(@item1.price)
    expect(page).to_not have_content(@item2.name)
    expect(page).to_not have_content(@item2.price)
    expect(page).to_not have_content(@item3.name)
    expect(page).to_not have_content(@item3.price)

    expect(page).to_not have_content(@supermarket1.name)
  end

  # User Story 2
  it "can fill out a form to add an item to this customer" do
    visit "/customers/#{@customer1.id}"

    fill_in :item_id, with: @item8.id
    click_button "Submit"

    expect(current_path).to eq("/customers/#{@customer1.id}")

    within("#item-#{@item8.id}") do
      expect(page).to have_content("Item: #{@item8.name}")
      expect(page).to have_content("Price: $#{@item8.price}")
      expect(page).to have_content("Supermarket Name: #{@supermarket2.name}")
    end
  end

  it "can fill out a form to add an item to another customer" do
    visit "/customers/#{@customer2.id}"

    fill_in :item_id, with: @item4.id
    click_button "Submit"

    expect(current_path).to eq("/customers/#{@customer2.id}")

    within("#item-#{@item4.id}") do
      expect(page).to have_content("Item: #{@item4.name}")
      expect(page).to have_content("Price: $#{@item4.price}")
      expect(page).to have_content("Supermarket Name: #{@supermarket1.name}")
    end
  end
end