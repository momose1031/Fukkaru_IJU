class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    if resource_name == :admin
       admin_customers_path
    elsif resource_name == :customer
       customer_path(current_customer.id)
    end
  end
 
 def after_sign_out_path_for(resource)
  if resource == :admin
     new_admin_session_path
  else
     new_customer_session_path
  end
 end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :country])
  end
end
