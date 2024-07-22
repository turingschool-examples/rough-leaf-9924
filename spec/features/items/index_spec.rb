require "rails_helper"

RSpec.describe "Items Index page" do
  it "shows all the items and other details" do
    supermarket = Supermarket.create!(name: "Corner Market", location: "123 Main St")
    customer1 = Customer.create!(name: "Sally")
    customer2 = Customer.create!(name: "Chris")
    item1 = Item.create!(name: "Banana", price: 1, supermarket: supermarket)
    item2 = Item.create!(name: "Apple", price: 2, supermarket: supermarket)
    customer1.items << [item1, item2]
    customer2.items << item1

    visit "/items"

    within "#item-#{item1.id}" do
      expect(page).to have_content("Banana")
      expect(page).to have_content("$1")
      expect(page).to have_content("Corner Market")
      expect(page).to have_content("Customers: 2")
    end

    within "#item-#{item2.id}" do
      expect(page).to have_content("Apple")
      expect(page).to have_content("$2")
      expect(page).to have_content("Corner Market")
      expect(page).to have_content("Customers: 1")
    end
  end
end