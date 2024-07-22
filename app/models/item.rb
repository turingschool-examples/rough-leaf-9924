class Item < ApplicationRecord
  belongs_to :supermarket
  has_many :customers
  belongs_to :customer
end