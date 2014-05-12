class SiteController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [ :auth_callback ]
  # before_action :is_authenticated?, except: [ :callback ]

  def index
    @events = Event.all
    @events_by_date = @events.group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def auth_callback
    auth = request.env['omniauth.auth']
    session[:current_user] = { :nickname => auth.info['nickname'],
                                          :image => auth.info['image'],
                                          :uid => auth.uid }

    redirect_to root_url
  end

  def privacy

  end

  def terms

  end

end