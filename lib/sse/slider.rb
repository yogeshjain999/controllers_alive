module SSE
  class Slider

    SLIDE_SEP = /\|\d\|/

    def initialize(stream)
      @stream = stream
      @file   = File.new("#{Rails.root}/slides.md")
    end

    def write
      until @file.eof?
        slide = fetch_slide
        @stream.write("#{slide}\n")
        sleep 1
      end
    end

    def close
      # Tell browser don't try to reconnect
      @stream.write("event: close\n")

      @stream.close
    end

    private

    def fetch_slide(buffer = '')
      loop do
        line = "data: #{markdown.render(@file.gets)}"
        if line.match(SLIDE_SEP) then break buffer else buffer += line end
      end
    end

    def markdown  
      @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    end
  end
end
