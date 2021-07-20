class Public::ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
    render :action => 'new'
  end

  def confirm
    @contact = Contact.new(params[:contact].permit(:name, :email, :message))
    if @inquiry.valid?
      render :action => 'confirm'
    else
      render :action => 'new'
    end
  end

  def complete
    @contact = Contact.new(params[:contact].permit(:name, :email, :message))    
    ContactMailer.received_email(@contact).deliver
    render :action => 'complete'
  end
  
end
