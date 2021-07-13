class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @customers = Customer.all
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer), notice: "プロフィールを更新しました"
    else
      render "edit", alert: "更新に失敗しました"
    end
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:image, :name, :email, :introduction, :country, :is_deleted)
  end
end
