class FishingGearsController < ApplicationController
  before_action :require_login

  def index
    keyword = params[:keyword] || '釣り具' # デフォルト値を設定
    @items = search_rakuten_api(keyword) # search_rakuten_apiメソッドを呼び出す
  end

  private

  def search_rakuten_api(keyword)
    items = RakutenWebService::Ichiba::Item.search(keyword: keyword)
    items.map do |item|
      {
        name: item['itemName'],
        price: item['itemPrice'],
        url: item['itemUrl'],
        image: item['mediumImageUrls'].first['imageUrl']
      }
    end
  end
end
