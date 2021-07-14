class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]
  
  def index
    @customers = Customer.page(params[:page]).per(12)
  end
  
  def show
    @customer = Customer.find(params[:id])
    if current_customer.is_deleted == true
      redirect_to root_path, alert: "このユーザーは退会済みです"
    end
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end
  
  def edit
    @customer = Customer.find(params[:id])
    if @customer != current_customer
      redirect_to customer_path(current_customer.id), alert: "不正なアクセスです"
    elsif current_customer.is_deleted == true
      redirect_to root_path, alert: "このユーザーは退会済みです"
    end
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer), notice: "プロフィールを更新しました"
    else
      render "edit", alert: "更新に失敗しました"
    end
  end
  
  def unsubscribe
    @customer = current_customer
  end
  
  def withdraw
    current_customer.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: "ご利用ありがとうございました"
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:image, :name, :email, :introduction, :country)
  end
end
