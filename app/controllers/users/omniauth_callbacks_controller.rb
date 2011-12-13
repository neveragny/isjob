class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def facebook
    # You need to implement the method below in your model
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def vkontakte
    @user= User.find_for_vkontakte_oauth(env["omniauth.auth"], current_user)

    if @user.persisted?
      Rails.logger.debug "PERSISTED ->"
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Vkontakte"
      sign_in_and_redirect @user, :event => :authentication
    else
      Rails.logger.debug "NOT PERSISTED ->"
      session["devise.vkontakte_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    Rails.logger.debug "AND failure still occured :("
    if env["omniauth.auth"].empty?
      super
    else
      vkontakte
    end
  end

  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

end


#callback from VKONTAKTE
#
#{"provider"=>"vkontakte",
# "uid"=>6405836,
# "credentials"=>
#     {"token"=>"8c5cdce88c3d62248c3d6224538c18054118c3d8c3c42a24b1b20081b551936"},
# "user_info"=>
#     {"first_name"=>"Nikita",
#      "last_name"=>"Demeschenko",
#      "name"=>"Nikita Demeschenko",
#      "nickname"=>"",
#      "birth_date"=>"4.9.1988",
#      "image"=>"http://cs9483.vkontakte.ru/u6405836/e_51110823.jpg",
#      "location"=>", ",
#      "urls"=>{"Vkontakte"=>"http://vkontakte.ru/id6405836"}
#     },
# "extra"=>
#     {"user_hash"=>
#          {"gender"=>"2", "timezone"=>2, "photo_big"=>"http://cs9483.vkontakte.ru/u6405836/a_a4c59406.jpg"}
#     }
#}
