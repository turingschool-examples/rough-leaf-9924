class Customer
  has_many :customer_items
  has_many :items, through: :customer_items
end