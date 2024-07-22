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

  describe "User Story #2 - Adding Items" do
    it "adds customer items via a form" do
    # Story 2

    # As a visitor,
    # When I visit a customer's show page,
    # Then I see a form to add an item to this customer.
    # When I fill in a field with the id of an existing item,
    # And I click submit,
    # Then I am redirected back to the customer's show page, 
    # And I see the item now listed under this customer's items.
    # (You do not have to test for a sad path, for example if the ID submitted is not an existing item)
    customer_1 = Customer.create!(name: "Larry")

    supermarket_1 = Supermarket.create!(name: "Wally World", location: "451 South Main St")
    supermarket_2 = Supermarket.create!(name: "Tarzhay", location: "2500 Alder Ave")

    item_1 = Item.create!(name: "milk", price: 4, supermarket: supermarket_1)
    item_2 = Item.create!(name: "bread", price: 3, supermarket: supermarket_2)

    visit "/customers/#{customer_1.id}"

    expect(page).to have_field(:add_item)
    expect(page).to have_button("Submit")

    fill_in :add_item, with: "#{item_1.id}"
    click_button "Submit"

    expect(current_path).to eq("/customers/#{customer_1.id}")

    expect(page).to have_content("#{item_1.name}")
    end
  end
end