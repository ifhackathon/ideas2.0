class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  Devise.mappings[:user].to.omniauth_providers.each do |provider|
    define_method provider.to_s do
      @user = UsersService.find_for_oauth(request.env["omniauth.auth"])
      if @user.persisted?
        sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, :kind => t("auth.#{provider.to_s}")) if is_navigational_format?
      end
    end
  end

  def failure
    if omniauth_params.include?('target')
      redirect_to omniauth_params['target']
    else
      redirect_to root_path
    end
  end

end