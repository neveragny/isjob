class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource
  before_filter :set_locale

  def add_class_error(error_messages, field)
    if error_messages[field].present?
      error
    end
  end

  protected
  def layout_by_resource
    if devise_controller? && resource_name == :admin
      "layout_name_for_devise_admin"
    else
      "application"
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

end


