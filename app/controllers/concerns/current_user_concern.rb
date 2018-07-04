module CurrentUserConcern 
  extend ActiveSupport::Concern

  def current_user
    super || guest_user
  end
  
  def guest_user 
    return OpenStruct.new(name:       "Guest User", 
                          first_name: "Guest", 
                          last_name:  "User", 
                          email:      "guser@example.com")
  end
end