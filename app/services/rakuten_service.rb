class RakutenService
  def self.search_rakuten_api(keyword)
    return [] if keyword.blank? # キーワードが空の場合は空の配列を返す

    items = RakutenWebService::Ichiba::Item.search(keyword:).first(8) # 指定されたkeywordを基にアイテムを検索し、結果はitemsに代入
    items.map do |item|
      {
        name: item['itemName'],
        price: item['itemPrice'],
        url: item['itemUrl'],
        image: item['mediumImageUrls'].first
      }
    end
  end
end
