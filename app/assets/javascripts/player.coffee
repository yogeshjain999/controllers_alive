$ ->
  $(document).on 'DOMNodeInserted', '#player', ->
    videojs('player')
