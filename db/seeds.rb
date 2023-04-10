# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CustomerItem.destroy_all
Customer.destroy_all
Item.destroy_all
Supermarket.destroy_all

@supermarket_1 = Supermarket.create!(name: "The Sto", location: "1234 Street")
@supermarket_2 = Supermarket.create!(name: "The Otha Sto", location: "1235 Street")
@customer_1 = Customer.create!(name: "Joe")
@customer_2 = Customer.create!(name: "John")
@customer_3 = Customer.create!(name: "Jacob")
@item_1 = @supermarket_1.items.create!(name: "Soap", price: 1)
@item_2 = @supermarket_1.items.create!(name: "Shampoo", price: 5)
@item_3 = @supermarket_2.items.create!(name: "Conditioner", price: 10)
@item_4 = @supermarket_2.items.create!(name: "Hair Rinse", price: 6)

CustomerItem.create!(customer_id: @customer_1.id, item_id: @item_1.id)
CustomerItem.create!(customer_id: @customer_1.id, item_id: @item_2.id)
CustomerItem.create!(customer_id: @customer_2.id, item_id: @item_3.id)
CustomerItem.create!(customer_id: @customer_2.id, item_id: @item_4.id)
CustomerItem.create!(customer_id: @customer_3.id, item_id: @item_1.id)
CustomerItem.create!(customer_id: @customer_3.id, item_id: @item_3.id)
CustomerItem.create!(customer_id: @customer_3.id, item_id: @item_2.id)