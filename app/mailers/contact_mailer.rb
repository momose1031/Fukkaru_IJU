class ContactMailer < ApplicationMailer
  
  # default from: "メールアドレス環境変数入れる"
  
  def received_email(contact)
    @contact = contact
    mail(:to => contact.email, :subject => 'お問い合わせを承りました')
  end
  
end
