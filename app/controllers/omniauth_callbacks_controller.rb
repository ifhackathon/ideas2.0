class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  Rails.application.config.omniauth_providers.each do |provider, name|
    define_method provider.to_s do
      @user = UsersService.find_for_oauth(request.env["omniauth.auth"])
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, kind: name) if is_navigational_format?
      end
    end
  end

  def failure
    if session['omniauth_params'] && session['omniauth_params'].include?('target')
      redirect_to session['omniauth_params']['target']
    else
      redirect_to root_path
    end
  end

end
