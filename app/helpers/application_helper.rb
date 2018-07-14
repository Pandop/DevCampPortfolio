module ApplicationHelper

  def login_helper(style='')
    if current_user.is_a?(GuestUser)
      (link_to('Register', new_user_registration_path, class: style)) + " ".html_safe + 
      (link_to('Log In',   new_user_session_path, class: style))      
    else
      link_to('Log Out',destroy_user_session_path, method: :delete, class: style)
    end
  end

  def source_helper(layout_name='') 
    greeting = "Thanks for vising me from #{session[:source]} 
                and you are on the #{layout_name} layout"
                
    if session[:source]      
      content_tag(:p, greeting, class: "source-greeting")
    end
  end

  def copyright_generator 
    @copyright = SkelViewTool::Renderer.copyright("Stephen Kel", 
                                                  "All rights reserved",
                                                  "copyright-class")
  end
  def nav_items 
    return [{
      url: root_path,
      title: 'Home'
    },
    {
      url: about_me_path,
      title: 'About Me'
    },
    {
      url: contact_path,
      title: 'Contact'
    },
    {
      url: blogs_path,
      title: 'Blog'
    },
    {
      url: portfolios_path,
      title: 'Portfolio'
    },
    {
      url: tech_news_path,
      title: 'Tech News'
    }]
  end

  def nav_helper(style, tag_type='')
    nav_links = ''

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? (item[:url])}'>#{item[:title]}</a></#{tag_type}>"
    end
    return nav_links.html_safe
  end

  def alerts 
    alert = (flash[:alert] || flash[:error] || flash[:notice])
    if alert
      alert_generator(alert)
    end
  end

  def alert_generator(msg)
    js add_gritter(msg, title: "Stephen Kel's Portfolio!", sticky: false, class_name: "alert alert-warning")
  end
##..........................................................................
  def sample_helper
    content_tag(:div, "My Content", class: "my-class")
  end

  private
  def active? (path)
    return "active" if current_page?(path)
  end
end
