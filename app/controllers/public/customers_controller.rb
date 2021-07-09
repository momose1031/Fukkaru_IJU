class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @customers = Customer.page(params[:page]).per(12)
  end
  
  def show
    @customer = Customer.find(params[:id])
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end
  
  def edit
  end
  
  def update
  end
  
  def unsubscribe
  end
  
  def withdraw
  end
end
