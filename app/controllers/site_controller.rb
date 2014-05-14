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

  def friends
    response = HTTParty.get("http://api.steampowered.com/ISteamUser/GetFriendList/v0001/?key=9006A23029A4FD05FB8E43D7467183E8&steamid=76561197970217281&relationship=friend")
    # Go get the friend data and include it in the response array
    render json: response
  end

  def persona
    url = "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=9006A23029A4FD05FB8E43D7467183E8&steamids=#{params[:steamids]}"
    response = HTTParty.get(url)

    render json: response
  end
  def privacy
    #getting friends list
# http://api.steampowered.com/ISteamUser/GetFriendList/v0001/?key=9006A23029A4FD05FB8E43D7467183E8&steamid=76561197970217281&relationship=friend
  end

  def terms
    #getting individual players via the player summary
# http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=9006A23029A4FD05FB8E43D7467183E8&steamids=76561197964824247
  end

end


# TODO
# use GetFriendList and then use player summary adding all friends steamid seperated by commas