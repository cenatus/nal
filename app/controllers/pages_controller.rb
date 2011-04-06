class PagesController < ApplicationController
  def dynamic

    slug = params[:slug].blank? ? "festival" : params[:slug]

    @page = Page.where(:slug => slug, :year => params[:year]).limit(1).first
    @section = @page.section if !@page.blank?

    if @page.blank?
      raise ActiveRecord::RecordNotFound
    end

  end

end
