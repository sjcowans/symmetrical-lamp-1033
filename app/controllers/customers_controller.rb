class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.permit(:name)
  end
end