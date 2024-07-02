class OauthsController < ApplicationController
  # newとcreateアクションに対してrequire_loginというbefore_action（フィルタ）をスキップ(ログイン不要)
  skip_before_action :require_login
  def oauth
    # 指定されたプロバイダの認証ページにリダイレクト
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]

    if auth_params[:code].blank?
      handle_auth_cancellation and return
    end

    # 既存のユーザーをプロバイダ情報を元に検索し、存在すればログイン
    if (@user = login_from(provider))
      handle_existing_user(provider)
    else
      handle_new_user(provider)
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

  def handle_auth_cancellation
    redirect_to root_path, alert: t('oauths.cancel')
  end

  def handle_existing_user(provider)
    redirect_to root_path, notice: t('oauths.success', provider: provider.titleize)
  end

  # ユーザーが存在しない場合はプロバイダ情報を元に新規ユーザーを作成し、ログイン
  def handle_new_user(provider)
    signup_and_login(provider)
    redirect_to root_path, notice: t('oauths.success', provider: provider.titleize)
  rescue StandardError => e
    redirect_to root_path, alert: t('oauths.failure', provider: provider.titleize, error: e.message)
    redirect_to root_path
  end
end
