$ ->
  $(document).on 'DOMNodeInserted', '#player', ->
    player = videojs('player')
