$ ->
  $('#event_date').datepicker
    dateFormat: 'yy-mm-dd'


  $('.event_time').timepicker()

  $.ajax '/friends',
    method: 'GET',
    contentType: 'application/json',
    dataType: 'json',
    success: (data) ->
      # console.log data.friendslist.friends

      friends = data.friendslist.friends
      console.log friends

      steamids = friends.map (friend) -> friend.steamid
      steamids = steamids.join(',')
      console.log steamids

      $.ajax '/persona',
        method: 'GET',
        data: {'steamids': steamids },
        contentType: 'application/json',
        dataType: 'json',
        success: (data) ->
          players = data.response.players


          ul = $('#friends-list ul')

          for player in players
            li = $('<li></li>')
            li.html player.personaname
            ul.append li
