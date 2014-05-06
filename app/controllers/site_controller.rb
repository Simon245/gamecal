class SiteController < ApplicationController

  def index
    @events = Events.all
    @events_by_date = @events.group_by(&:event_date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def event

  end

  def privacy

  end

  def terms

  end

end