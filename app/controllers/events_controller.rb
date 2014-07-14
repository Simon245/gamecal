class EventsController < ApplicationController

  def index

  end

  def new
    @event = Event.new
  end

  def create
        @event = Event.new(event_params)

    @event.save
    redirect_to @event
  end

  def show

  end

  def event_params
    params.require(:event).permit(:game_id, :owner, :date, :time_start, :time_finish, :friend_id, :email_address, :description)

  end
end