module ApplicationHelper

  def login_helper 
    if current_user.is_a?(User)
      link_to('Log Out',destroy_user_session_path, method: :delete)
    else
      link_to('Register', new_user_registration_path) + "<br>".html_safe + 
      link_to('Log In',   new_user_session_path)
    end
  end

  def source_helper(layout_name='') 
    greeting = "Thanks for vising me from #{session[:source]} 
                and you are on the #{layout_name} layout"
                
    if session[:source]      
      content_tag(:p, greeting, class: "source-greeting")
    end
  end

##..........................................................................
  def sample_helper
    content_tag(:div, "My Content", class: "my-class")
  end
end
