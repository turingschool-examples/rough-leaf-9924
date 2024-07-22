require 'rails_helper'

RSpec.describe "customer show page" do 
  it "displays customer's name, items name and price, name of supermarket" do 
    kroger = Supermarket.create!(name: 'Kroger', location: '123 4th St., Nashville, TN 56789')
    leah = Customer.create!(name: 'Leah')
    food = kroger.items.create!(name: 'Kibble', price: 20)
    treat = kroger.items.create!(name: 'Bones', price: 10)
    CustomerItem.create!(customer: leah, item: food)
    CustomerItem.create!(customer: leah, item: treat)

    visit "/customers/#{leah.id}"

    within ".customer-info" do 
      expect(page).to have_content(leah.name)
    end

    within ".item-info" do 
      expect(page).to have_content("Item Name: #{food.name}")
      expect(page).to have_content("Item Price: #{food.price}")
      expect(page).to have_content("Supermarket: #{food.supermarket.name}")
      expect(page).to have_content("Item Name: #{treat.name}")
      expect(page).to have_content("Item Price: #{treat.price}")
      expect(page).to have_content("Supermarket: #{food.supermarket.name}")
    end

  end
end