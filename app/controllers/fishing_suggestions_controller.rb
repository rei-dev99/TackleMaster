class FishingSuggestionsController < ApplicationController
  before_action :require_login
  before_action :set_user
  before_action :set_fishing_suggestion, only: %i[show edit update destroy]

  def index
    @fishing_suggestions = @user.fishing_suggestions.order(created_at: :desc).page(params[:page]).per(8)
  end

  def show
    @keyword = self.class.extract_product_name(@fishing_suggestion.suggestion) # 提案内容から商品名を抽出
    if @keyword.present?
      begin
        @items = RakutenService.search_rakuten_api(@keyword) # 抽出した商品名で楽天APIを検索
      rescue RakutenWebService::WrongParameter => e
        Rails.logger.error("Rakuten API Error: #{e.message}")
        @items = [] # 検索が失敗した場合、空の配列を設定
        @error_message = t('fishing_suggestions.show.not_found_products')
      end
    else
      @items = [] # キーワードが無効な場合、空の配列を設定
      @error_message = t('fishing_suggestions.show.not_found_products')
    end
  end

  def new
    @fishing_suggestion = @user.fishing_suggestions.build
    keyword = params[:keyword] || t('fishing_suggestions.new.fishing_gear')
    @items = RakutenService.search_rakuten_api(keyword)
  end

  def create
    @fishing_suggestion = @user.fishing_suggestions.build(fishing_suggestion_params)
    if @user.can_suggest?
      handle_suggestion_creation
    else
      suggestion_limit # 提案回数の上限に達した場合の処理
    end
  end

  def edit; end

  def update
    if @fishing_suggestion.update(fishing_suggestion_params)
      redirect_to fishing_suggestion_path(@fishing_suggestion), notice: t('fishing_suggestions.update.success')
    else
      flash.now[:alert] = t('fishing_suggestions.update.failure')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @fishing_suggestion.destroy
    redirect_to fishing_suggestions_path, notice: t('fishing_suggestions.destroy.success'), status: :see_other
  end

  private

  def set_user
    @user = current_user
  end

  def set_fishing_suggestion
    @fishing_suggestion = @user.fishing_suggestions.find(params[:id])
  end

  def fishing_suggestion_params
    required_params = [
      :fish_type,
      :budget,
      :location,
      :fishing_type,
      :tackle_type,
      :tackle_maker,
      :skill_level,
      :memo
    ]
    params.require(:fishing_suggestion).permit(*required_params)
  end

  def all_params_present?
    required_params = [
      :fish_type, :budget, :location, :fishing_type,
      :tackle_type, :tackle_maker, :skill_level
    ]
    required_params.all? { |param| params[:fishing_suggestion][param].present? }
  end

  def suggestion_limit
    redirect_to fishing_suggestions_path, alert: t('fishing_suggestions.suggestion_limit.failure')
  end

  public_class_method def self.extract_product_name(text)
    return unless text =~ /(?:「)([^」]+)(?:」)/ # 「」の中の商品名を抽出する

    ::Regexp.last_match(1).strip
  end

  def handle_suggestion_creation
    if all_params_present?
      create_suggestion
    else
      keyword = params[:keyword] || t('fishing_suggestions.new.fishing_suggestion')
      @items = search_rakuten_api(keyword)
      render :new
    end
  end

  def create_suggestion
    @suggestion = OpenaiService.get_chat_response(fishing_suggestion_params)
    Rails.logger.info("OpenAI Suggestion: #{@suggestion}")
    keyword = self.class.extract_product_name(@suggestion) # 商品名を提案から抽出
    Rails.logger.info("Extracted Keyword: #{keyword}")

    @fishing_suggestion.suggestion = @suggestion

    if @fishing_suggestion.save
      @user.increment_suggestion_count # 提案回数の増加
      redirect_to @fishing_suggestion, notice: t('fishing_suggestions.create.success')
    else
      keyword = params[:keyword] || t('fishing_suggestions.new.fishing_suggestion')
      @items = search_rakuten_api(keyword)
      flash.now[:alert] = t('tackles.create.failure')
      render :new, status: :unprocessable_entity
    end
  end
end
