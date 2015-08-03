module SSE
  class Slider

    SLIDE_SEP = /\|\|/

    def initialize(stream)
      @stream = stream
      @file   = File.new("#{Rails.root}/slides.md")
    end

    def write
      until @file.eof?
        slide = fetch_slide
        sleep 1
        @stream.write("#{slide}\n") rescue IOError
      end
    end

    def close
      # Tell browser don't try to reconnect
      @stream.write("event: close\n") rescue IOError

      @stream.close
    end

    private

    def fetch_slide(buffer = '')
      loop do
        line = "data: #{markdown.render(@file.gets).gsub("\n", '')}\n"
        if line.match(SLIDE_SEP) then break buffer else buffer += line end
      end
    end

    def markdown  
      @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true, fenced_code_blocks: true)
    end
  end
end
