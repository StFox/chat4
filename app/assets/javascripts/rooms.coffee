$(document).on "ready", ->
  $("#new_message").bind "ajax:complete", (event,xhr,status) -> 
    $('#message_text').val('');
    $('.messages').scrollTop($('.messages')[0].scrollHeight)
  $('.messages').scrollTop($('.messages')[0].scrollHeight)
  $('.messages').scroll (event) ->
    if $(event.target).scrollTop() == 0 & gon.last_page != true
      height_to = $('.messages')[0].scrollHeight
      $.getScript $('a[rel=next]')[0].href, (data, textStatus, jqxhr) ->
        heigth_after = $('.messages')[0].scrollHeight
        $(event.target).scrollTop(heigth_after - height_to)
      
