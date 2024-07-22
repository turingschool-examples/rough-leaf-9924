require "rails_helper"

RSpec.describe "Add Item to Customer" do
  it "should add an item to the customer" do
    supermarket = Supermarket.create!(name: "Corner Market", location: "123 Main St")
    customer = Customer.create!(name: "Sally")
    item1 = Item.create!(name: "Banana", price: 1, supermarket: supermarket)
    item2 = Item.create!(name: "Apple", price: 2, supermarket: supermarket)
    customer.items << item1

    visit "/customers/#{customer.id}"

    expect(page).to have_content("Banana")
    expect(page).to_not have_content("Apple")

    fill_in "Item ID", with: item2.id
    click_button "Add Item"

    expect(current_path).to eq("/customers/#{customer.id}")
    expect(page).to have_content("Apple")
  end
end