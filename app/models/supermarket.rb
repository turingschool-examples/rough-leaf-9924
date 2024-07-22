class Supermarket < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true

  has_many :items
end