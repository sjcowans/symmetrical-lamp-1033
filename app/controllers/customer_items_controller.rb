class CustomerItemsController < ApplicationController
  def create
    CustomerItem.create!(customer_id: params[:id], item_id: params[:add_item])
    redirect_to "/customers/#{params[:id]}"
  end
end