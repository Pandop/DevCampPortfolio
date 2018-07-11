class Portfolio < ApplicationRecord
  has_many :technologies, dependent: :destroy

  accepts_nested_attributes_for :technologies, 
                                reject_if: lambda{ |attrs| attrs['name'].blank? }

  validates :title, presence: true, length: { minimum: 5 } 

  validates :body, presence: true

  validates :main_image, :thumb_image, presence: true

  after_initialize :set_defaults  

  include Placeholder

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

  def self.by_position 
    order("position ASC")
  end

  def set_defaults
    self.main_image  ||= Placeholder.generate_image(600, 400)
    self.thumb_image ||= Placeholder.generate_image(356, 280)

    #self.main_image  ||= "http://via.placeholder.com/600x400"
    #self.thumb_image ||= "http://via.placeholder.com/350x200" 

   ## if self.main_image == nil 
      #self.main_image = "http://via.placeholder.com/600x400"
    #end
  ##  if
    # self.thumb_image ||= "http://via.placeholder.com/350x200"
    #end
  end
end
