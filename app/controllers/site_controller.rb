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

    session[:uid] = auth.uid

    redirect_to root_url
  end

  def friends
    response = HTTParty.get("http://api.steampowered.com/ISteamUser/GetFriendList/v0001/?key=9006A23029A4FD05FB8E43D7467183E8&steamid=#{session[:uid]}&relationship=friend")

    render json: response
  end

  def persona
    url = "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=9006A23029A4FD05FB8E43D7467183E8&steamids=#{params[:steamids]}"
    response = HTTParty.get(url)

    render json: response
  end

  def privacy

  end

  def terms

  end

end