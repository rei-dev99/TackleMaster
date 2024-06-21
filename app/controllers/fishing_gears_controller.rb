class FishingGearsController < ApplicationController
  before_action :require_login
  before_action :set_user
  before_action :set_fishing_gear, only: %i[show edit update destroy]

  def index
    @fishing_gears = @user.fishing_gears
  end

  def show
    keyword = self.class.extract_product_name(@fishing_gear.suggestion) # 提案内容から商品名を抽出
    if keyword.present?
      begin
        @items = search_rakuten_api(keyword) # 抽出した商品名で楽天APIを検索
      rescue RakutenWebService::WrongParameter => e
        Rails.logger.error("Rakuten API Error: #{e.message}")
        @items = [] # 検索が失敗した場合、空の配列を設定
        @error_message = "商品が見つかりません"
      end
    else
      @items = [] # キーワードが無効な場合、空の配列を設定
      @error_message = "商品が見つかりません"
    end
  end

  def new
    @fishing_gear = @user.fishing_gears.build # buildは親インスタンスに子インスタンスを作成するときに必要
    keyword = params[:keyword] || '釣り具' # デフォルト値を設定、値が存在しなければ釣具で検索される
    @items = search_rakuten_api(keyword) # search_rakuten_apiメソッドを呼び出し結果を@itemsインスタンス変数に代入。これにより、ビューで@itemsを使って検索結果を表示できるようになる
  end

  def create
    @fishing_gear = @user.fishing_gears.build(fishing_gear_params)
    if @user.can_suggest?
      if all_params_present? # ユーザーがフォームで入力したデータを取得
        @suggestion = OpenaiService.get_chat_response(fishing_gear_params) # OpenAI APIで提案をもらう
        Rails.logger.info("OpenAI Suggestion: #{@suggestion}") # ここでビューに渡す
        keyword = self.class.extract_product_name(@suggestion) # 商品名を提案から抽出
        Rails.logger.info("Extracted Keyword: #{keyword}")

        @fishing_gear.suggestion = @suggestion

        if @fishing_gear.save
          @user.increment_suggestion_count # 提案回数を増加させる
          redirect_to @fishing_gear
        else
          flash.now[:alert] = '提案の作成に失敗しました'
          render :new, status: :unprocessable_entity
        end
      else
        keyword = params[:keyword] || '釣り具'
        @items = search_rakuten_api(keyword)
        render :new
      end
    else
      # 提案回数の上限に達した場合の処理
      suggestion_limit
    end
  end

  def edit; end

  def update
    if @fishing_gear.update(fishing_gear_params)
      redirect_to fishing_gear_path(@fishing_gear)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @fishing_gear.destroy
    redirect_to fishing_gears_path, notice: "提案内容を削除しました", status: :see_other
  end

  private

  def set_user
    @user = current_user
  end

  def set_fishing_gear
    @fishing_gear = @user.fishing_gears.find(params[:id])
  end

  def fishing_gear_params
    params.require(:fishing_gear).permit(:fish_type, :budget, :location, :fishing_type, :tackle_type, :tackle_maker, :skill_level, :memo)
  end

  def all_params_present?
    required_params = [:fish_type, :budget, :location, :fishing_type, :tackle_type, :tackle_maker, :skill_level]
    required_params.all? { |param| params[:fishing_gear][param].present? }
  end

  def suggestion_limit
    flash.now[:alert] = '提案回数の上限に達しました。'
    redirect_to tackles_path
  end

  def self.extract_product_name(text)
    if text =~ /(?:「|")([^「」"]+)(?:」|")/ # 商品名を抽出するための正規表現を定義「」の中の商品をとって代入
      $1.strip
    else
      nil
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
