class UserController < ApplicationController
  before_action :authenticate_user!, except: [:profile]

  def profile
    @user = User.find(params[:id])
  end

  def project
    @user_projects = current_user.projects
  end
end
