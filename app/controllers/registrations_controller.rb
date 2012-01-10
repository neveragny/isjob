class RegistrationsController < Devise::RegistrationsController
  def new
    resource = build_resource({})
    render_for params, resource
  end

  def create
    build_resource
    #resource.build_company(params[:user][:company_attributes])
    #resource.skip_confirmation!
    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :inactive_signed_up, :reason => inactive_reason(resource) if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      Rails.logger.debug "params[:user][:company] = #{params[:user][:company_attributes]}"
      clean_up_passwords(resource)
      render_for params, resource
    end
    session[:omniauth] = nil unless @user.new_record?
  end

  private

  def render_for(params, resource)
    is_company = params[:company].present? || ( params[:user] && params[:user][:company_attributes].present? )
    is_company ? respond_with_navigational(resource) { render_with_scope :new, 'registrations/company' }
               : respond_with_navigational(resource) { render_with_scope :new }
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
