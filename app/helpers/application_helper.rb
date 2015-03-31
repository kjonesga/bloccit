module ApplicationHelper

def form_group_tag(errors, &block)
     if errors.any?
       content_tag :div, capture(&block), class: 'form-group has-error'
     else
       content_tag :div, capture(&block), class: 'form-group'
     end
   end
end

def markdown_title(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
end

def markdown_body(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
end

def pagination_links(path, total, per_page, current_page)
  links = "<ul>"
  page_index = 3
  links += "<li><a href=#{path}?page=#{page_index}>#{page_index}</a></li>"
  links += "</ul>"
  links.html_safe
end