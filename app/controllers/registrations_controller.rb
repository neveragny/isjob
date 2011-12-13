class RegistrationsController < Devise::RegistrationsController

  def create
    super
    session[:omniauth] = nil unless @user.new_record? 
  end
  
  private
  
  def build_resource(*args)
    super
    if session[:omniauth]
      @user.aply_omniauth(session[:omniauth])
      @user.valid?
    end
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end
end
