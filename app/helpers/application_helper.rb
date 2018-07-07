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

##..........................................................................
  def sample_helper
    content_tag(:div, "My Content", class: "my-class")
  end
end
