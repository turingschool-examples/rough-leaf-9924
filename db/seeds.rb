# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@kroger = Supermarket.create!(name: 'Kroger', location: '123 4th St., Nashville, TN 56789')

@leah = Customer.create!(name: 'Leah')

@food = @kroger.items.create!(name: 'Kibble', price: 20)
@treat = @kroger.items.create!(name: 'Bones', price: 10)

CustomerItem.create!(customer: @leah, item: @food)
CustomerItem.create!(customer: @leah, item: @treat)