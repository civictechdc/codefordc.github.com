=begin
    Jekyll tag to include Markdown text from _includes directory preprocessing with Liquid.
    via https://gist.github.com/tmtk75/1408402
Usage:
    {% markdown <filename> %}
Dependency:
    - kramdown
=end
module Jekyll
    class MarkdownTag < Liquid::Tag
        def initialize(tag_name, text, tokens)
            super
            @text = text.strip
        end
        require "kramdown"
        def render(context)
            tmpl = File.read File.join Dir.pwd, "_includes", @text
            site = context.registers[:site]
            tmpl = (Liquid::Template.parse tmpl).render site.site_payload
            html = Kramdown::Document.new(tmpl).to_html
        end
    end
end
Liquid::Template.register_tag('markdown', Jekyll::MarkdownTag)
