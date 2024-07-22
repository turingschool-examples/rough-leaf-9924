class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true

  belongs_to :supermarket
  has_many :customer_items 
  has_many :customers, through: :customer_items
end