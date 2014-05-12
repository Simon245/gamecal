# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

description_simon = %{
  Game on
}.squish


simon = Event.create(game_id: 'Left 4 Dead', owner: 'Simon', date: '09/05/14', time_start: '12:00am', finish_time: '01:00am', description: 'description_simon' )