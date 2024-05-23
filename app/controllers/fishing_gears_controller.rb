class FishingGearsController < ApplicationController
  before_action :require_login

  def index
    # ユーザーがフォームで入力したデータを取得
    if params[:fish_type].present? && params[:budget].present? && params[:location].present? && params[:method].present? && params[:skill_level].present?
      # OpenAI APIで提案をもらう
      suggestion = get_openai_suggestions(
        fish_type: params[:fish_type],
        budget: params[:budget],
        location: params[:location],
        method: params[:method],
        skill_level: params[:skill_level]
      )
      keyword = suggestion # 提案を元に検索キーワードを決定
    else
      keyword = params[:keyword] || '釣り具' # デフォルト値を設定、値が存在しなければ釣具で検索される
    end

    @items = search_rakuten_api(keyword) # search_rakuten_apiメソッドを呼び出し結果を@itemsインスタンス変数に代入。これにより、ビューで@itemsを使って検索結果を表示できるようになる
  end

  def new; end

  def create; end

  def destroy; end

  private

  # OpenAI APIを使って提案をもらうメソッド
  def get_openai_suggestions(fish_type:, budget:, location:, method:, skill_level:)
    client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
    prompt = <<~PROMPT
      ユーザーは#{fish_type}を釣るために、予算#{budget}円、場所は#{location}、釣法は#{method}、スキルレベルは#{skill_level}です。
      この条件に合う釣り具を提案してください。
    PROMPT

    response = client.completions(
      parameters: {
        model: 'gpt-4o',
        prompt: prompt,
        max_tokens: 150
      }
    )
    response['choices'].first['text'].strip
  end

  # 楽天APIを使ってアイテムを検索する
  def search_rakuten_api(keyword)
    items = RakutenWebService::Ichiba::Item.search(keyword: keyword) # 指定されたkeywordを基にアイテムを検索し、結果はitemsに代入
    items.map do |item| # itemsをループし、各アイテムを特定のフォーマットに変換
      { # 各アイテムから必要な情報（名前、価格、URL、画像URL）を抽出し、ハッシュ形式で返す
        name: item['itemName'],
        price: item['itemPrice'],
        url: item['itemUrl'],
        image: item['mediumImageUrls'].first['imageUrl']
      }
    end
  end
end
