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
          console.log data


      ul = $('#friends-list ul')

      for friend in data.friendslist.friends
        li = $('<li></li>')
        li.html friend.steamid # Change this to the HTML you need for a single friend
        ul.append li
