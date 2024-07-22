class Customer < ApplicationRecord
  validates :name, presence: true
  has_many :customers_items
  has_many :items, through: :customers_items
end
