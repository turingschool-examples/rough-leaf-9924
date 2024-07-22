require 'rails_helper'

RSpec.describe Supermarket, type: :model do
  describe 'relationships' do
    it { should have_many :items }
    it { should have_many(:customers).through(:items) }
  end

  describe 'instance methods' do
    it '#unique_customers' do
      supermarket_1 = Supermarket.create(name: 'Safeway', location: 'Denver')
      supermarket_2 = Supermarket.create(name: 'King Soopers', location: 'Denver')

      customer_1 = Customer.create(name: 'Joe')
      customer_2 = Customer.create(name: 'Sally')

      #safeway
      item_1 = Item.create(name: 'Apple', price: 1, supermarket_id: supermarket_1.id)
      item_2 = Item.create(name: 'Banana', price: 2, supermarket_id: supermarket_1.id)
      item_3 = Item.create(name: 'Cereal', price: 3, supermarket_id: supermarket_1.id)
      #soopers
      item_4 = Item.create(name: 'Apple', price: 1, supermarket_id: supermarket_2.id)
      item_5 = Item.create(name: 'Banana', price: 2, supermarket_id: supermarket_2.id)
      item_6 = Item.create(name: 'Cereal', price: 3, supermarket_id: supermarket_2.id)

      CustomerItem.create(customer_id: customer_1.id, item_id: item_1.id)
      CustomerItem.create(customer_id: customer_1.id, item_id: item_2.id)
      CustomerItem.create(customer_id: customer_1.id, item_id: item_1.id)

      CustomerItem.create(customer_id: customer_2.id, item_id: item_4.id)
      CustomerItem.create(customer_id: customer_2.id, item_id: item_5.id)
      CustomerItem.create(customer_id: customer_2.id, item_id: item_6.id)

      expect(supermarket_1.unique_customers).to eq([customer_1])
      expect(supermarket_2.unique_customers).to eq([customer_2])
    end
  end
end