class Customer < ApplicationRecord
  validates :name, presence: true 
  
  has_many :customer_items
  has_many :items, through: :customer_items
end