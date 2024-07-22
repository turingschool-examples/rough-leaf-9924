require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it { should have_many :customer_items }
    it { should have_many(:items).through(:customer_items) }
  end

  it 'can add an item to the customer' do
    supermarket = Supermarket.create(name: 'Safeway', location: 'Denver')
    customer = Customer.create(name: 'Joe')
    item_1 = Item.create(name: 'Apple', price: 1, supermarket_id: supermarket.id)
    item_2 = Item.create(name: 'Banana', price: 2, supermarket_id: supermarket.id)
    item_3 = Item.create(name: 'Cereal', price: 3, supermarket_id: supermarket.id)

    customer.add_item(item_1.id)
    customer.add_item(item_2.id)

    expect(customer.items).to eq([item_1, item_2])

    customer.add_item(item_3.id)

    expect(customer.items).to eq([item_1, item_2, item_3])
  end
end