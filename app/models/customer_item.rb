class CustomerItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def add_item
    customer = Customer.find(params[:id])
    item = Item.find(params[:item_id])
    CustomerItem.create!(customer: customer, item: item)
    redirect_to "/customers/#{customer.id}"
  end
end