require 'rails_helper'

RSpec.describe 'item index page' do
  describe 'as a visitor on the index page' do
    before(:each) do
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
    end

    it 'lists all items and attributes with purchase count' do
      visit '/items'
      within "#item-#{@item_1.id}" do
        expect(page).to have_content(@item_1.name)
        expect(page).to have_content(@item_1.price)
        expect(page).to have_content(@item_1.supermarket.name)
        expect(page).to have_content("Customer Purchases: 2")
      end
      within "#item-#{@item_2.id}" do
        expect(page).to have_content(@item_2.name)
        expect(page).to have_content(@item_2.price)
        expect(page).to have_content(@item_2.supermarket.name)
        expect(page).to have_content("Customer Purchases: 2")
      end
      within "#item-#{@item_3.id}" do
        expect(page).to have_content(@item_3.name)
        expect(page).to have_content(@item_3.price)
        expect(page).to have_content(@item_3.supermarket.name)
        expect(page).to have_content("Customer Purchases: 2")
      end
      within "#item-#{@item_4.id}" do
        expect(page).to have_content(@item_4.name)
        expect(page).to have_content(@item_4.price)
        expect(page).to have_content(@item_4.supermarket.name)
        expect(page).to have_content("Customer Purchases: 1")
      end
    end
  end
end

