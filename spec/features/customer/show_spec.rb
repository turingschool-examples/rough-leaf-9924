require 'rails_helper'

# Story 1

# As a visitor, 
# When I visit a customer show page,
# I see the customer's name,
# And I see its a list of its items
# including the item's name, price, and the name of the supermarket that it belongs to.

RSpec.describe "Customer Show:" do
  before(:each) do

    @wwe = Supermarket.create!(name: "World Wrestling Entertainment Supermarket")
    @wcw = Supermarket.create!(name: "World Championship Wrestling Supermarket")

    @sting = Customer.create!(name: "Sting")
    @mankind = Customer.create!(name: "Mankind")
    @undertaker = Customer.create!(name: "The Undertaker")
    @stonecold = Customer.create!(name: "Stone Cold Steve Austin")
    @goldenboy = Customer.create!(name: "Ric Flair")

    @ladder = wwe.items.create!(name: "Ladder", price: 420)
    @table = wwe.items.create!(name: "Folding Table", price: 690)
    @tacks = wwe.items.create!(name: "Thumb Tacks", price: 666)
    @bat = wcw.items.create!(name: "Baseball Bat", price: 303)
    @beer = wcw.items.create!(name: "Beer - 6 Pack", price: 316)
    @sock = wcw.items.create!(name: "Sock", price: 369)

  end

  describe "As a user," do
    describe "when I visit the customer show page," do
      it "I see the customer's name, and a list of their items" do
        visit "/customers/#{customer.id}"

        expect(page).to have_content("Name: #{customer.name}")
        expect(page).to have_content("Items: #{customer_items}")

      end

      it "including the item's name, price, and the name of the supermarket that it belongs to." do
        visit "/customers/#{customer.id}"

        expect(page).to 

      end
  end
end