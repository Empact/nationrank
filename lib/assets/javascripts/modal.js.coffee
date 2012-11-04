#= require twitter/bootstrap/modal

$(document).on('click', '[data-behavior=modal]', (event) ->
  event.preventDefault()
  $.ajax($(event.target).closest('[href]').attr('href'),
    success: (data) -> $(data).modal()
    dataType: 'html'
  )
)
