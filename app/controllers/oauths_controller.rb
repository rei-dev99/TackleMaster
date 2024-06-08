class OauthsController < ApplicationController
  # newとcreateアクションに対してrequire_loginというbefore_action（フィルタ）をスキップ(ログイン不要)
  skip_before_action :require_login
  def oauth
    #指定されたプロバイダの認証ページにリダイレクト
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]

    if auth_params[:code].blank?
      flash[:alert] = "Google認証がキャンセルされました"
      redirect_to root_path and return
    end

    # 既存のユーザーをプロバイダ情報を元に検索し、存在すればログイン
    if (@user = login_from(provider))
      redirect_to tackles_path, success: "#{provider.titleize}アカウントでログインしました"
    else
      begin
        # ユーザーが存在しない場合はプロバイダ情報を元に新規ユーザーを作成し、ログイン
        signup_and_login(provider)
        redirect_to tackles_path, success: "#{provider.titleize}アカウントでログインしました"
      rescue => e
        flash.now[:alert] = "#{provider.titleize}アカウントでのログインに失敗しました"
        redirect_to root_path
      end
    end
  end

  private

  def auth_params
    params.permit(:code, :provider, :scope, :authuser, :prompt)
  end

  def signup_and_login(provider)
    @user = create_from(provider)
    Rails.logger.debug "Created user: #{@user.inspect}"
    reset_session
    auto_login(@user)
  end
end
