require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many :customer_items }
    it { should have_many(:customers).through(:customer_items) }
  end

  describe 'instance methods' do
    it '#number_sold' do
      supermarket = Supermarket.create(name: 'Safeway', location: 'Denver')

      customer_1 = Customer.create(name: 'Joe')
      customer_2 = Customer.create(name: 'Sally')

      item_1 = Item.create(name: 'Apple', price: 1, supermarket_id: supermarket.id)
      item_2 = Item.create(name: 'Banana', price: 2, supermarket_id: supermarket.id)
      item_3 = Item.create(name: 'Cereal', price: 3, supermarket_id: supermarket.id)

      CustomerItem.create(customer_id: customer_1.id, item_id: item_1.id)
      CustomerItem.create(customer_id: customer_1.id, item_id: item_2.id)
      CustomerItem.create(customer_id: customer_1.id, item_id: item_1.id)

      CustomerItem.create(customer_id: customer_2.id, item_id: item_2.id)
      CustomerItem.create(customer_id: customer_2.id, item_id: item_2.id)
      CustomerItem.create(customer_id: customer_2.id, item_id: item_2.id)

      expect(item_1.number_sold).to eq(2)
      expect(item_2.number_sold).to eq(4)
      expect(item_3.number_sold).to eq(0)
    end
  end
end