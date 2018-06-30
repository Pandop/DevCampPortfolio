class Portfolio < ApplicationRecord

  validates :title, presence: true, length: { minimum: 5 } 

  validates :body, presence: true

  validates :main_image, :thumb_image, presence: true

  after_initialize :set_defaults

  # scope :angular, ->{where(subtitle: "Angular")}
  # scope :sorted,  ->{order("created_at DESC")}
  # scope :ruby_on_rails_portfolio_items, ->{where(subtitle: "Ruby on Rails")}
  # Same as below:

  def self.angular
    where(subtitle: "Angular")
  end

  def self.ruby_on_rails_portfolio_items 
    where(subtitle: "Ruby on Rails")
  end

  def self.sorted 
    order("created_at DESC")
  end

  def set_defaults
    self.main_image  ||= "http://via.placeholder.com/600x400"
    self.thumb_image ||= "http://via.placeholder.com/350x200" 

   ## if self.main_image == nil 
      #self.main_image = "http://via.placeholder.com/600x400"
    #end
  ##  if
    # self.thumb_image ||= "http://via.placeholder.com/350x200"
    #end
  end

end
