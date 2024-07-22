# Story 1

# As a visitor, 
# When I visit a customer show page,
# I see the customer's name,
# And I see its a list of its items
# including the item's name, price, and the name of the supermarket that it belongs to.

require "rails_helper"

RSpec.describe "Customer Show Page", type: :feature do
  describe "User Story #1" do
    it "shows the customer's name, a list of their items (with their names, price, and associated supermarket)" do
      customer_1 = Customer.create!(name: "Larry")

      supermarket_1 = Supermarket.create!(name: "Wally World", location: "451 South Main St")
      supermarket_2 = Supermarket.create!(name: "Tarzhay", location: "2500 Alder Ave")

      item_1 = Item.create!(name: "milk", price: 4, supermarket: supermarket_1)
      item_2 = Item.create!(name: "bread", price: 3, supermarket: supermarket_2)

      CustomerItem.create!(customer: customer_1, item: item_1)
      CustomerItem.create!(customer: customer_1, item: item_2)

      visit "/customers/#{customer_1.id}"

      expect(page).to have_content("Name: #{customer_1.name}")

      expect(page).to have_content("Items:")
      expect(page).to have_content("#{item_1.name}")
      expect(page).to have_content("#{item_2.name}")
      
      expect(page).to have_content("#{item_1.price}")
      expect(page).to have_content("#{item_2.price}")

      expect(page).to have_content("#{item_1.supermarket.name}")     
      expect(page).to have_content("#{item_2.supermarket.name}")     
    end
  end
end