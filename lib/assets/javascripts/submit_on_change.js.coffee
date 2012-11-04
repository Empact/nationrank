$(document).on('change', '[data-behavior=submit_on_change] :input', (e)->
  $(this).closest('form').submit();
)
