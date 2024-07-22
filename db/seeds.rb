# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@supermarket1 = Supermarket.create!(name: "Khabib's Market", location: "Just send me location." )
@supermarket2 = Supermarket.create!(name: "Acutal Market", location: "12345 Actual Location Avenue ")

@item1 = @supermarket1.create!(name: "Tap Like Chicken", price: 100)
@item2 = @supermarket2.create!(name: "Actual Chicken", price: 5)
@item3 = @supermarket1.create!(name: "Bueooogerss", price: 50)
@item4 = @supermarket2.create!(name: "Burgers", price: 10)
@item5 = @supermarket2.create!(name: "Beeaarrzzz", price: 50)
@item6 = @supermarket2.create!(name: "Proper Number Twelve Irish Whiskey", price: 2)

@customer1 = Customer.create!(name: "Khabib")
@customer2 = Customer.create!(name: "Islam")
@customer3 = Customer.create!(name: "Conor")

@customer_items1 = CustomerItem.create!(customer: @customer1, item: @item1)
@customer_items2 = CustomerItem.create!(customer: @customer1, item: @item3)
@customer_items3 = CustomerItem.create!(customer: @customer1, item: @item5)
@customer_items4 = CustomerItem.create!(customer: @customer2, item: @item1)
@customer_items5 = CustomerItem.create!(customer: @customer2, item: @item3)
@customer_items6 = CustomerItem.create!(customer: @customer2, item: @item5)
@customer_items7 = CustomerItem.create!(customer: @customer3, item: @item2)
@customer_items8 = CustomerItem.create!(customer: @customer3, item: @item4)
@customer_items9 = CustomerItem.create!(customer: @customer3, item: @item6)