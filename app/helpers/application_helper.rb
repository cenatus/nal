module ApplicationHelper

  def nav_link(name, options = {}, html_options = {}, &block)
    if current_page?(options)
      html_options[:class] ? html_options[:class] << " active" :
          html_options[:class] = "active"
    end
    link_to(name, options, html_options, &block)
  end

  def textilize_without_paragraph(text, *options)
    textiled = textilize(text, *options)
    if textiled[0..2] == "<p>" then
      textiled = textiled[3..-1]
    end
    if textiled[-4..-1] == "</p>" then
      textiled = textiled[0..-5]
    end
    return textiled
  end


  def article_image(klass)
    return "" if (!klass.respond_to?(:assets) || klass.assets.blank?)
    haml_tag "IMG.article_image", :src => klass.assets.first.asset.url
  end

  def article_thumb(klass)
    return "" if (!klass.respond_to?(:assets) || klass.assets.blank?)
    haml_tag "IMG.thumb_image", :src => klass.assets.first.thumb.url
  end

  def formatted(date)
    date.strftime("%d-%m-%Y")
  end

end
