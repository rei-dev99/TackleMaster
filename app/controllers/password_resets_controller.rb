class PasswordResetsController < ApplicationController
  skip_before_action :require_login

  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      @user.deliver_reset_password_instructions!
      flash[:notice] = 'パスワードリセットのメールを送信しました'
    else
      flash[:alert] = 'Emailが見つかりません'
    end
    redirect_to login_path
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
      redirect_to login_path
      flash[:notice] = 'パスワードがリセットされました'
    else
      render :edit, status: :unprocessable_entity
    end
  end
end
