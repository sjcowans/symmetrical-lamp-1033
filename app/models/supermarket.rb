class Supermarket < ApplicationRecord
  has_many :items
  has_many :customers, through: :items
  
  def customer_list
    self.customers.distinct
  end
end