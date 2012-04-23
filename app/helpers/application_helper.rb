module ApplicationHelper
  
  def icon(name, content)
    raw("<i class=\"icon-#{name}\"></i> ") + content
  end
  
  def is_active?(path)
    "active" if current_page?(path)
  end
  
  def current_page_is_a_project?(id)
    current_page?(new_project_url) || current_page?(edit_project_url(id)) 
  end
  
  def is_current?(path)
    current_page?(path)
  end
  
  def content_tag_for(url, title, id)
    content_tag(:li, link_to( is_current?(url) ? icon("share-alt", title) : title, url, class: is_active?(url), id: id))
  end
  
  def gravatar_for(user, options = { size: 50 })
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      size = options[:size]
      gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
      image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
  
  class HTMLwithPygments < Redcarpet::Render::HTML
    # include Redcarpet::Render::SmartyPants
    def block_code(code, language)
      Pygments.highlight(code, :lexer => language)
    end
  end
  
  def markdown(text)
    renderer = HTMLwithPygments.new(:hard_wrap => true)
    options = {
      :fenced_code_blocks => true,
      :no_intra_emphasis => true,
      :autolink => true,
      :strikethrough => true,
      :lax_html_blocks => true,
      :superscript => true,
      :gh_blockcode => true,
      :smart => true,
      :tables => true
    }
    Redcarpet::Markdown.new(renderer, options).render(text)
  end
  
end
