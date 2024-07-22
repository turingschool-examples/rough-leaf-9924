require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many :customer_items }
    it { should have_many(:customers).through(:customer_items) }
  end

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

    CustomerItem.create!(customer_id: @customer1.id, item_id: @item5.id)
    CustomerItem.create!(customer_id: @customer1.id, item_id: @item6.id)
    CustomerItem.create!(customer_id: @customer2.id, item_id: @item1.id)
    CustomerItem.create!(customer_id: @customer2.id, item_id: @item2.id)
  end

  describe "instance methods" do
    it "customer_count" do
      expect(@item1.customer_count).to eq 2
      expect(@item2.customer_count).to eq 2
      expect(@item3.customer_count).to eq 1
      expect(@item4.customer_count).to eq 0
      expect(@item5.customer_count).to eq 2
      expect(@item6.customer_count).to eq 2
      expect(@item7.customer_count).to eq 1
      expect(@item8.customer_count).to eq 0
    end
  end
end