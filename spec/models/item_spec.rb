require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it{should have_and_belong_to_many :customers}
  end

  describe "model methods" do
    it "should return the number of customers that bought that item" do
      supermarket = Supermarket.create!(name: "Corner Market", location: "123 Main St")
    customer1 = Customer.create!(name: "Sally")
    customer2 = Customer.create!(name: "Chris")
    item1 = Item.create!(name: "Banana", price: 1, supermarket: supermarket)
    customer1.items << item1
    customer2.items << item1

    expect(item1.customer_count).to eq(2)
    end
  end
end