class SiteController < ApplicationController

  def index
    @articles = {}
    @articles_by_date = @articles.group_by(&:published_on)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def create

  end

  def privacy

  end

  def terms

  end

end