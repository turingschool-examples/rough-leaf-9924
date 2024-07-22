class Customer < ApplicationRecord
  has_many :items
  belongs_to :item
end