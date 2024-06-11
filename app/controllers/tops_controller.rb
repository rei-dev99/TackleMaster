class TopsController < ApplicationController
  skip_before_action :require_login, only: %i[index privacy_policy terms_of_service]

  def index; end

  def privacy_policy; end

  def terms_of_service; end
end
