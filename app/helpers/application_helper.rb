module ApplicationHelper
  def flash_background_color(type)
    case type.to_sym
    when :notice then "bg-orange"
    when :alert  then "bg-orange"
    when :error  then "bg-orage"
    else "bg-silver"
    end
  end

  def page_title(title = '')
    base_title = 'Tackle Master'
    title.present? ? "#{title} | #{base_title}" : base_title
  end
end
