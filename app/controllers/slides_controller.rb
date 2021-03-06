class SlidesController < ApplicationController
  include ActionController::Live

  def stream
    response.headers['Content-Type'] = 'text/event-stream'

    slider = ::SSE::Slider.new(response.stream)

    begin
      slider.write
    ensure
      slider.close
      logger.info 'INFO: Channel closed'
    end
  end
end
