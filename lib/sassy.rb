require 'compass'
require 'sass'

extension_path = File.expand_path(File.join(File.dirname(__FILE__), ".."))
Compass::Frameworks.register('sassy', :path => extension_path)

module Sassy
  VERSION = "1.0.0"
  DATE = "2015-08-11"
end

module Sass::Script::Functions

  def inline_svg(path, stroke = nil, fill = nil)
     real_path = File.join(Compass.configuration.images_path, path.value)
    svg = get_data(real_path)
    unless stroke.nil?
      if(stroke.is_a?(String))
        s = stroke.value
      else
        s = stroke
      end
      svg.gsub!(/(?:stroke="([^"]+))"/, %{stroke=\"#{s}\"})
    end
    unless fill.nil?
      if(fill.is_a?(String))
        f = fill.value
      else
        f = fill
      end
      svg.gsub!(/(?:fill="([^"]+))"/, %{fill=\"#{f}\"})
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