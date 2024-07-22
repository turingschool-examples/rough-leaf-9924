class Supermarket < ApplicationRecord
  has_many :items
  has_many :customers, through: :items

  def unique_customers
    self.customers.distinct
  end
end