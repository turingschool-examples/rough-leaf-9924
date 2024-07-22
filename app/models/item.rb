class Item < ApplicationRecord
  belongs_to :supermarket
  has_many :customer_items
  has _many :customers, through: :customer_items
end