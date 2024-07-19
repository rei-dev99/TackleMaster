module ApplicationHelper
  def page_title(title = '')
    base_title = 'Tackle Master'
    title.present? ? "#{title} | #{base_title}" : base_title
  end

  def default_meta_tags
    {
      site: 'Tackle Master',
      title: 'タックルマスター',
      reverse: true,
      charset: 'utf-8',
      description: '釣り道具の管理・登録・検索ができるサービス',
      keywords: '釣り,釣り道具,タックル',
      canonical: request.original_url,
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('tackle_service.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' }
      ],
      og: {
        site_name: 'Tackle Master',
        title: 'タックルマスター',
        description: '釣り道具の管理・登録・検索ができるサービス',
        url: request.original_url,
        image: image_url('tackle_service.jpg'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@ida09r',
        image: image_url('tackle_service.jpg')
      }
    }
  end
end
