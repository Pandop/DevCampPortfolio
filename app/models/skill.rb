class Skill < ApplicationRecord

  include Placeholder

  validates :title, presence: true, length: { minimum: 5}

  validates :percent_completed, presence: true

  after_initialize :set_defaults

  def set_defaults
    self.badge  ||= Placeholder.generate_image(250, 250)
    #self.badge  ||= "http://via.placeholder.com/250x250"
   ## if self.main_image == nil 
      #self.badge = "http://via.placeholder.com/600x400"
    #end
  end
end
