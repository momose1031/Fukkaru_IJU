class ContactMailer < ApplicationMailer
  default from: ENV['SEND_MAIL']
  
  def received_email(contact)
    @contact = contact
    mail(:to => contact.email, :subject => 'お問い合わせを承りました')
  end
  
end
