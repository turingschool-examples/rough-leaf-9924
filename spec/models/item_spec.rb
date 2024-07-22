require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many(:customers) }
  end

  describe 'model methods' do
    before(:each) do
      @supermarket = Supermarket.create!(name: 'Test Supermarket')
      @customer = Customer.create!(name: 'John Doe')
      @item = Item.create!(name: 'Test Item', price: 9.99, supermarket: @supermarket)
      @item.customers << @customer
    end

    describe '#supermarket_name' do
      it 'returns the name of the supermarket' do
        expect(@item.supermarket_name).to eq('Test Supermarket')
      end
    end

    describe '#customer_count' do
      it 'returns the number of customers' do
        expect(@item.customer_count).to eq(1)
      end
    end
  end
end