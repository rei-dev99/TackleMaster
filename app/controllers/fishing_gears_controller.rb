class FishingGearsController < ApplicationController
  before_action :require_login
  before_action :set_user
  before_action :set_fishing_gear, only: %i[show edit update destroy]

  def index
    @fishing_gears = @user.fishing_gears.page(params[:page]).per(4)
  end

  def show
    keyword = self.class.extract_product_name(@fishing_gear.suggestion) # 提案内容から商品名を抽出
    if keyword.present?
      begin
        @items = search_rakuten_api(keyword) # 抽出した商品名で楽天APIを検索
      rescue RakutenWebService::WrongParameter => e
        Rails.logger.error("Rakuten API Error: #{e.message}")
        @items = [] # 検索が失敗した場合、空の配列を設定
        @error_message = t('fishing_gears.show.not_found_products')
      end
    else
      @items = [] # キーワードが無効な場合、空の配列を設定
      @error_message = t('fishing_gears.show.not_found_products')
    end
  end

  def new
    @fishing_gear = @user.fishing_gears.build # buildは親インスタンスに子インスタンスを作成するときに必要
    keyword = params[:keyword] || t('fishing_gears.new.fishing_gear') # デフォルト値を設定、値が存在しなければ釣具で検索される
    @items = search_rakuten_api(keyword) # search_rakuten_apiメソッドを呼び出し結果を@itemsインスタンス変数に代入。これにより、ビューで@itemsを使って検索結果を表示できるようになる
  end

  def create
    @fishing_gear = @user.fishing_gears.build(fishing_gear_params)
    if @user.can_suggest?
      handle_suggestion_creation
    else
      # 提案回数の上限に達した場合の処理
      suggestion_limit
    end
  end

  def edit; end

  def update
    if @fishing_gear.update(fishing_gear_params)
      redirect_to fishing_gear_path(@fishing_gear), notice: t('fishing_gears.update.success')
    else
      flash.now[:alert] = t('fishing_gears.update.failure')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @fishing_gear.destroy
    redirect_to fishing_gears_path, notice: t('fishing_gears.destroy.success'), status: :see_other
  end

  private

  def set_user
    @user = current_user
  end

  def set_fishing_gear
    @fishing_gear = @user.fishing_gears.find(params[:id])
  end

  def fishing_gear_params
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
    params.require(:fishing_gear).permit(*required_params)
  end

  def all_params_present?
    required_params = [
      :fish_type, :budget, :location, :fishing_type,
      :tackle_type, :tackle_maker, :skill_level
    ]
    required_params.all? { |param| params[:fishing_gear][param].present? }
  end

  def suggestion_limit
    redirect_to fishing_gears_path, alert: t('fishing_gears.suggestion_limit.failure')
  end

  def self.extract_product_name(text)
    return unless text =~ /(?:「)([^」]+)(?:」)/ # 「」の中の商品名を抽出する正規表現

    ::Regexp.last_match(1).strip
  end

  # private_class_method :extract_product_name

  def handle_suggestion_creation
    if all_params_present? # ユーザーがフォームで入力したデータを取得
      create_suggestion
    else
      keyword = params[:keyword] || t('fishing_gears.new.fishing_gear')
      @items = search_rakuten_api(keyword)
      render :new
    end
  end

  def create_suggestion
    @suggestion = OpenaiService.get_chat_response(fishing_gear_params) # OpenAI APIで提案をもらう
    Rails.logger.info("OpenAI Suggestion: #{@suggestion}") # ここでビューに渡す
    keyword = self.class.extract_product_name(@suggestion) # 商品名を提案から抽出
    Rails.logger.info("Extracted Keyword: #{keyword}")

    @fishing_gear.suggestion = @suggestion

    if @fishing_gear.save
      @user.increment_suggestion_count # 提案回数を増加させる
      redirect_to @fishing_gear, notice: t('fishing_gears.create.success')
    else
      flash.now[:alert] = t('tackles.create.failure')
      render :new, status: :unprocessable_entity
    end
  end

  # 楽天APIを使ってアイテムを検索する
  def search_rakuten_api(keyword)
    return [] if keyword.blank? # キーワードが空の場合は空の配列を返す

    items = RakutenWebService::Ichiba::Item.search(keyword:).first(8) # 指定されたkeywordを基にアイテムを検索し、結果はitemsに代入
    items.map do |item| # itemsをループし、各アイテムを特定のフォーマットに変換
      { # 各アイテムから必要な情報（名前、価格、URL、画像URL）を抽出
        name: item['itemName'],
        price: item['itemPrice'],
        url: item['itemUrl'],
        image: item['mediumImageUrls'].first
      }
    end
  end
end
