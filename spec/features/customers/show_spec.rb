require "rails_helper"

RSpec.describe 'customers show' do

  before :each do
    @supermarket1 = Supermarket.create!(name: "Khabib's Market", location: "Just send me location." )
    @supermarket2 = Supermarket.create!(name: "Acutal Market", location: "12345 Actual Location Avenue ")

    @item1 = @supermarket1.items.create!(name: "Tap Like Chicken", price: 100)
    @item2 = @supermarket2.items.create!(name: "Actual Chicken", price: 5)
    @item3 = @supermarket1.items.create!(name: "Bueooogerss", price: 50)
    @item4 = @supermarket2.items.create!(name: "Burgers", price: 10)
    @item5 = @supermarket1.items.create!(name: "Beeaarrzzz", price: 50)
    @item6 = @supermarket2.items.create!(name: "Proper Number Twelve Irish Whiskey", price: 2)

    @customer1 = Customer.create!(name: "Khabib")
    @customer2 = Customer.create!(name: "Islam")
    @customer3 = Customer.create!(name: "Conor")

    @customer_items1 = CustomerItem.create!(customer: @customer1, item: @item1)
    @customer_items2 = CustomerItem.create!(customer: @customer1, item: @item3)
    @customer_items3 = CustomerItem.create!(customer: @customer1, item: @item5)
    @customer_items4 = CustomerItem.create!(customer: @customer2, item: @item1)
    @customer_items5 = CustomerItem.create!(customer: @customer2, item: @item3)
    @customer_items6 = CustomerItem.create!(customer: @customer2, item: @item5)
    @customer_items7 = CustomerItem.create!(customer: @customer3, item: @item2)
    @customer_items8 = CustomerItem.create!(customer: @customer3, item: @item4)
    @customer_items9 = CustomerItem.create!(customer: @customer3, item: @item6)
  end

  describe 'as a visitor' do
    describe 'when I visit /customers/:id' do 
      it 'displays the customers name and lists all the items associated with that customer, including the item price and supermarket it belongs to' do
        
        visit "/customers/#{@customer1.id}"

        expect(page).to have_content("#{@customer1.name} Show Page")
        expect(page).to have_content("__Items__")
        expect(page).to have_content("Item Name: #{@item1.name}")
        expect(page).to have_content("Item Price: #{@item1.price}")
        expect(page).to have_content("Item Supermarket: #{@item1.supermarket.name}")

        # within ("") do
        # end
      end

      it 'has a form to add items to this customer by filling a field with the id of an existing customer' do
        visit "/customers/#{@customer1.id}"

        expect(page).to_not have_content("Item Name: #{@item2.name}")
        expect(page).to_not have_content("Item Supermarket: #{@item2.supermarket.name}")

        expect(page).to have_content("Add another item for this customer:")

        fill_in "item_id", with: "2"
        save_and_open_page
        click_button "Add Item"

        expect(page).to have_current_path("/customers/#{@customer1.id}")
        expect(page).to have_content("Item Name: #{@item2.name}")
        expect(page).to have_content("Item Supermarket: #{@item2.supermarket.name}")
      end
    end
  end
end