require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it { should have_many :customer_items }
    it { should have_many(:items).through(:customer_items) }
  end

  describe 'lists customer items' do
    before :each do
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

    it 'lists customer songs' do
      expect(@customer_1.customer_items).to eq([@item_1, @item_2])
    end
  end
end
