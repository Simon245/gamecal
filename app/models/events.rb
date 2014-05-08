class Events < ActiveRecord::Base

  belongs_to :user
  belongs_to :user_events
  belongs_to :game

end
