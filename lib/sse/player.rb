module SSE
  class Player

    MB = 1024 * 1024

    def initialize(stream)
      @stream = stream
      @file   = File.new('video.mp4')
    end

    def write
      until @file.eof?
        @stream.write @file.read(MB) rescue IOError
        Rails.logger.info "INFO: Pushed 1MB at #{DateTime.current} \n\n"
      end
    end

    def close
      @stream.close
    end
  end
end
