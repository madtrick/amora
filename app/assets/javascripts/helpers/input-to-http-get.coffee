$ ->
  $trigger = $("[data-behaviour=trigger-input-to-http-get]")
  $input   = $("[data-behaviour=url-to-http-get]")

  $trigger.on 'click', ->
    if $input.val() isnt ""
      window.location.assign encodeURIComponent($input.val())
