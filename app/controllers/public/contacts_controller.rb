class Public::ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
    render 'new'
  end

  def confirm
    @contact = Contact.new(params[:contact].permit(:name, :email, :message))
    if @contact.valid?
      render 'confirm'
    else
      render 'new'
    end
  end

  def complete
    @contact = Contact.new(params[:contact].permit(:name, :email, :message))    
    ContactMailer.received_email(@contact).deliver
    render 'complete'
  end

end
