class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || signed_in_root_path(resource_or_scope)
  end


  private
    def user_not_authorized(exception)
      policy_name = exception.policy.class.to_s.underscore

      flash[:alert] = I18n.t "pundit.#{policy_name}.#{exception.query}", default: 'You cannot perform this action.'
      redirect_to(request.referrer || root_path)
    end
end
