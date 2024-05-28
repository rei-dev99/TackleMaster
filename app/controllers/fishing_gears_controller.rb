require_relative '../services/openai_service'
class FishingGearsController < ApplicationController
  before_action :require_login

  def index
    # ユーザーがフォームで入力したデータを取得
    if params[:fish_type].present? && params[:budget].present? && params[:location].present? && params[:method].present? && params[:skill_level].present?
      # OpenAI APIで提案をもらう
      suggestion = OpenAIService.get_chat_response(params)
      Rails.logger.info("OpenAI Suggestion: #{suggestion}")# ここでビューに渡す
      keyword = params[:location] # 提案を元に検索キーワードを決定
    else
      keyword = params[:keyword] || '釣り具' # デフォルト値を設定、値が存在しなければ釣具で検索される
    end

    @items = search_rakuten_api(keyword) # search_rakuten_apiメソッドを呼び出し結果を@itemsインスタンス変数に代入。これにより、ビューで@itemsを使って検索結果を表示できるようになる
  end

  private

  # 楽天APIを使ってアイテムを検索する
  def search_rakuten_api(keyword)
    items = RakutenWebService::Ichiba::Item.search(keyword: keyword).first(10) # 指定されたkeywordを基にアイテムを検索し、結果はitemsに代入
    items.map do |item| # itemsをループし、各アイテムを特定のフォーマットに変換
      { # 各アイテムから必要な情報（名前、価格、URL、画像URL）を抽出
        name: item['itemName'],
        price: item['itemPrice'],
        url: item['itemUrl'],
        image: item['mediumImageUrls'].first['imageUrl']
      }
    end
  end
end
