require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many :customer_items }
    it { should have_many(:customers).through(:customer_items) }
  end

  describe 'methods' do 
    it "can count item #purchase_number" do 
      kroger = Supermarket.create!(name: 'Kroger', location: '123 4th St., Nashville, TN 56789')
      leah = Customer.create!(name: 'Leah')
      millie = Customer.create!(name: 'Millie')
      food = kroger.items.create!(name: 'Kibble', price: 20)
      treat = kroger.items.create!(name: 'Bones', price: 10)
      CustomerItem.create!(customer: leah, item: food)
      CustomerItem.create!(customer: leah, item: treat)
      CustomerItem.create!(customer: millie, item: food)

      expect(food.purchase_number).to eq(2)
      expect(treat.purchase_number).to eq(1)
    end
  end
end