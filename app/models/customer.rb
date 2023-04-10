class Customer < ApplicationRecord
  has_many :customer_items
  has_many :items, through: :customer_items

  def customer_items
    self.items
  end
end