require "rails_helper"

RSpec.describe "Customer Show page" do
  it "shows the customer name and their items" do
    supermarket = Supermarket.create!(name: "Corner Market", location: "123 Main St")
    customer = Customer.create!(name: "Sally")
    item1 = Item.create!(name: "Banana", price: 1, supermarket: supermarket)
    item2 = Item.create!(name: "Apple", price: 2, supermarket: supermarket)
    customer.items << [item1, item2]

    visit "/customers/#{customer.id}"
    
    expect(page).to have_content("Sally")
    expect(page).to have_content("Banana")
    expect(page).to have_content("$1")
    expect(page).to have_content("Corner Market")
    expect(page).to have_content("Apple")
    expect(page).to have_content("$2")
    expect(page).to have_content("Corner Market")
  end
end