module Placeholder
  extend ActiveSupport::Concern

  def self.generate_image(height, width) 
    return "http://via.placeholder.com/#{height}x#{width}"
  end
end