require "rails_helper"

RSpec.describe "Supermarket show page" do
  it "displays a unique list of all cutomers that have shopped here" do
    supermarket = Supermarket.create!(name: "Corner Market", location: "123 Main St")
    customer1 = Customer.create!(name: "Sally")
    customer2 = Customer.create!(name: "Chris")
    customer3 = Customer.create!(name: "Sam")
    item1 = Item.create!(name: "Banana", price: 1, supermarket: supermarket)
    item2 = Item.create!(name: "Apple", price: 2, supermarket: supermarket)
    customer1.items << item1
    customer2.items << item1
    customer2.items << item2
    customer3.items << item1

    visit "/supermarkets/#{supermarket.id}"

    expect(page).to have_content("Sally")
    expect(page).to have_content("Chris")
    expect(page).to have_content("Sam")
  end
end