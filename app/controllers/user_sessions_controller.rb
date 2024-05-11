class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to tackles_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other
  end
end
