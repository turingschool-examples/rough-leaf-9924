class Supermarket < ApplicationRecord
  has_many :items
  has_many :customers, through: :items

  def unique_customers
    customers.distinct
  end
end