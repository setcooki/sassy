require 'sass'

module Sass::Script::Functions

  def inline_svg(path, stroke = nil, fill = nil)
    real_path = File.join(Compass.configuration.images_path, path.value)
    svg = get_data(real_path)
    unless stroke.nil?
        svg.gsub!(/(?:stroke="([^"]+))"/, %{stroke=\"#{stroke.value}\"})
    end
    unless fill.nil?
        svg.gsub!(/(?:fill="([^"]+))"/, %{fill=\"#{fill.value}\"})
    end
    svg = make_inline(svg, 'image/svg+xml')
    Sass::Script::String.new(svg)
  end

private
  def make_inline(data, mime_type)
    data = [data].flatten.pack('m').gsub("\n","")
    url = "url('data:#{mime_type};base64,#{data}')"
    return unquote(url)
  end

private

  def get_data(real_path)
    if File.readable?(real_path)
      File.open(real_path, "rb") {|io| io.read}
    else
      raise Compass::Error, "File not found or cannot be read: #{real_path}"
    end
  end

end