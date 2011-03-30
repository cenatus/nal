class PagesController < ApplicationController
  def dynamic

    slug = params[:slug].blank? ? "home" : params[:slug]
    @menu = "hidden" if slug == "home" 

    @page = Page.where(:slug => slug).limit(1).first

    if @page.blank?
      raise ActiveRecord::RecordNotFound
    end

    layout_name = @page.blank? ? "home" : @page.name.downcase
#    @layout = CategoryLayout.get_layout(layout_name)

  end

end
