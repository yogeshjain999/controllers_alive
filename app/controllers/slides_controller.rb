class SlidesController < ApplicationController
  include ActionController::Live

  def stream
    response.headers['Content-Type'] = 'text/event-stream'

    slider = ::SSE::Slider.new(response.stream)

    begin
      slider.write
    rescue IOError
      logger.info 'INFO: Client got disconncted'
    ensure
      logger.info 'INFO: Channel closed'
      slider.close
    end
  end
end
