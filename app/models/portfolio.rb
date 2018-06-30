class Portfolio < ApplicationRecord

  validates :title, presence: true, length: { minimum: 5 } 

  validates :body, presence: true

  validates :main_image, :thumb_image, presence: true

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

end
