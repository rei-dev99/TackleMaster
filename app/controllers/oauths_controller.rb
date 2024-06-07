class OauthsController < ApplicationController
  # newとcreateアクションに対してrequire_loginというbefore_action（フィルタ）をスキップ(ログイン不要)
  skip_before_action :require_login
  def oauth
    #指定されたプロバイダの認証ページにリダイレクト
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    Rails.logger.debug "Provider: #{provider}"

    if auth_params[:code].blank?
      Rails.logger.error "Missing required parameter: code"
      flash[:alert] = "Google認証がキャンセルされました"
      redirect_to root_path and return
    end

    # 既存のユーザーをプロバイダ情報を元に検索し、存在すればログイン
    if (@user = login_from(provider))
      redirect_to tackles_path, success: "#{provider.titleize}アカウントでログインしました"
    else
      begin
        # Rails.logger.debug "User not found, creating new user from #{provider}"
        # ユーザーが存在しない場合はプロバイダ情報を元に新規ユーザーを作成し、ログイン
        signup_and_login(provider)
        redirect_to tackles_path, success: "#{provider.titleize}アカウントでログインしました"
      rescue => e
        # Rails.logger.error "Error during login from #{provider}: #{e.message}"
        flash.now[:alert] = "#{provider.titleize}アカウントでのログインに失敗しました"
        redirect_to root_path
      end
    end
  end

  private

  def auth_params
    params.permit(:code, :provider, :scope, :authuser, :prompt)
    # params.permit(:code, :provider, :error, :state)
  end

  def signup_and_login(provider)
    @user = create_from(provider)
    reset_session
    auto_login(@user)
  end
end
