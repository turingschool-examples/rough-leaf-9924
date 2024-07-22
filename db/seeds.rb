# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
supermarket1 = Supermarket.create!(name: 'Corner Market', location: '123 Food St.')
supermarket2 = Supermarket.create!(name: 'Green Grocers', location: '456 Veggie Ave.')

customer1 = Customer.create!(name: 'Kaelin')
customer2 = Customer.create!(name: 'Alex')

item1 = Item.create!(name: 'Banana', price: 1, supermarket: supermarket1)
item2 = Item.create!(name: 'Apple', price: 2, supermarket: supermarket1)
item3 = Item.create!(name: 'Carrot', price: 1, supermarket: supermarket2)

customer1.items << [item1, item2]
customer2.items << [item3]