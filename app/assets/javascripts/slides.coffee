$ ->
  source = new EventSource '/slides/stream'
  slides = []
  index  = 0

  source.addEventListener 'message', (e) ->
    console.log e.data
    slides.push e.data.split('\n')

  source.addEventListener 'close', (e) ->
    source.close()

  $('#begin').click  (e) ->
    e.preventDefault()
    $(this).remove()

    $('.container').html(slides[index])

  $(document).keydown (e) ->
    switch e.which
      when 37, 40
        index -= 1 unless index is 0
        $('.container').html(slides[index])

      when 38, 39
        index += 1 if index < slides.length - 1
        $('.container').html(slides[index])

    e.preventDefault()
