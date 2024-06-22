class PasswordResetsController < ApplicationController
  skip_before_action :require_login

  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      @user.deliver_reset_password_instructions!
      redirect_to login_path, notice: t('password_resets.create.send_mail')
    else
      flash.now[:alert] = t('password_resets.create.not_found')
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(@token)
    not_authenticated if @user.blank?
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(@token)

    return not_authenticated if @user.blank?

    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password(params[:user][:password])
      redirect_to login_path, notice: t('password_resets.update.success')
    else
      flash.now[:alert] = t('password_resets.update.failure')
      render :edit, status: :unprocessable_entity
    end
  end
end
