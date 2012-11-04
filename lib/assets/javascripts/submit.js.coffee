$(document).on('click', '[data-behavior=submit]', (event) ->
  target = $(event.target)
  $('#' + target.attr('rel')).submit()
)
