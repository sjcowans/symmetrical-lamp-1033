require 'rails_helper'

RSpec.describe 'customers show page' do
  describe 'as a visitor on the show page' do
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

    it 'lists customer names' do
      visit "/customers/#{@customer_1.id}"
      expect(page).to have_content(@customer_1.name)
      visit "/customers/#{@customer_2.id}"
      expect(page).to have_content(@customer_2.name)
      visit "/customers/#{@customer_3.id}"
      expect(page).to have_content(@customer_3.name)
    end

    it 'shows customer items with item info' do
      visit "/customers/#{@customer_1.id}"
      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@item_1.price)
      expect(page).to have_content(@item_2.name)
      expect(page).to have_content(@item_2.price)
      visit "/customers/#{@customer_2.id}"
      expect(page).to have_content(@item_3.name)
      expect(page).to have_content(@item_3.price)
      expect(page).to have_content(@item_4.name)
      expect(page).to have_content(@item_4.price)
      visit "/customers/#{@customer_3.id}"
      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@item_1.price)
      expect(page).to have_content(@item_2.name)
      expect(page).to have_content(@item_2.price)
      expect(page).to have_content(@item_3.name)
      expect(page).to have_content(@item_3.price)
    end

    it 'has add item form' do
      visit "/customers/#{@customer_1.id}"
      expect(find('form')).to have_content('Add item')   
    end

    it 'adds item and redirects back to page' do
      visit "/customers/#{@customer_1.id}"
      fill_in 'Add item', with: "#{@item_4.id}"
      click_button 'Save'
      expect(page).to have_content(@item_4.name)
      expect(page).to have_current_path("/customers/#{@customer_1.id}")
    end
  end
end
