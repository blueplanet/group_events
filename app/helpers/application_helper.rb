module ApplicationHelper
  def markdown(text)
    options = {
      autolink: true,
      space_after_headers: true
    }

    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer, options)
    markdown.render(text).html_safe
  end
end
