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


  def article_image(klass, options={:hover_flag => false, :link_flag =>true})
    return "" if (!klass.respond_to?(:assets) || klass.assets.blank?)
    class_slug = klass.class.to_s == "NewsItem" ? "News" : klass.class.to_s
    year = klass.class.to_s == "NewsItem" ? "" : "#{Nal::Application::CURRENT_YEAR}/"

    if options[:hover_flag] == true
      #sliding boxes plugin
      haml_tag "div.boxgrid.captionfull" do
        if options[:link_flag] == true
          haml_tag "a", {:href => "/#{year}#{class_slug.downcase}/#{klass.friendly_id}"} do
            display_img klass
          end
        else
          display_img klass
        end

        if !klass.assets.first.description.blank?
          haml_tag "div.cover.boxcaption" do
            haml_tag "h6" do
              haml_tag "p", klass.assets.first.description
            end
          end
        end
      end
    else
      if options[:link_flag] == true
        haml_tag "a", {:href => "/#{year}#{class_slug.downcase}/#{klass.friendly_id}"} do
          display_img klass
        end
      else
        display_img klass
      end
    end
  end

  def display_img (klass)
    haml_tag "IMG.article_image", :src => klass.assets.first.asset.url
  end
  def article_thumb(klass)
    return "" if (!klass.respond_to?(:assets) || klass.assets.blank?)
    class_slug = klass.class.to_s == "NewsItem" ? "News" : klass.class.to_s
    year = klass.class.to_s == "NewsItem" ? "" : "#{Nal::Application::CURRENT_YEAR}/"
    haml_tag "a", {:href => "/#{year}#{class_slug.downcase}/#{klass.friendly_id}"} do
      haml_tag "IMG.thumb_image", :src => klass.assets.first.thumb.url
    end
  end

  def formatted(date)
    date.strftime("%d-%m-%Y")
  end

  def w3c_date(date)
    date.strftime("%Y-%m-%dT%H:%M:%S+00:00")
  end

end
