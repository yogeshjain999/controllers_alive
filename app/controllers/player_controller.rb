class PlayerController < ApplicationController
  include ActionController::Live

  def index
    response.headers['Content-Type'] = 'text/event-stream'

    player = ::SSE::Player.new(response.stream)

    begin
      player.write
    ensure
      player.close
      logger.info 'INFO: Channel closed'
    end
  end
end
