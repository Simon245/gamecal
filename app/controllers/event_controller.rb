class EventController < ApplicationController

  def index

  end

  def create
    @event = Event.new(params[:event])

    @event.save
    redirect_to @event
  end


end