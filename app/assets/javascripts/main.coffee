###setUpAjax = ->
  token = $('meta[name="csrf-token"]').attr('content')
  $.ajaxSetup
    beforeSend: (xhr) ->
      xhr.setRequestHeader('X-CSRF-Token', token)###

$(()->
  $('#js-comment-form').parsley();

  $('.js-twitter-date').each (inx, rawDate) ->
    $(rawDate).html(moment($(rawDate).html(), 'YYYY-MM-DD HH:mm:ss Z').fromNow())

  comments = new Chupo.Managers.Comments()

  comments.fetch ->
    comments.showCollection()
  , limit: 10

  $("#js-comment-form").on "submit", (evt) ->
    evt.preventDefault()

    comments.add "#js-comment-form", (success) ->
      if success
        $("#js-comment-form").trigger('reset')
      else
        comments.showErrors()
)














