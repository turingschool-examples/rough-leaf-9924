class Item < ApplicationRecord
  belongs_to :supermarket
  has_and_belongs_to_many :customers

  def customer_count
    customers.count
  end
end