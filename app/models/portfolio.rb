class Portfolio < ApplicationRecord
  has_many :technologies, dependent: :destroy

  accepts_nested_attributes_for :technologies, 
                                reject_if: lambda{ |attrs| attrs['name'].blank? }

  validates :title, presence: true, length: { minimum: 5 } 

  validates :body, presence: true

  #validates :main_image, :thumb_image, presence: true

  #after_initialize :set_defaults  

  #include Placeholder

  # scope :angular, ->{where(subtitle: "Angular")}
  # scope :sorted,  ->{order("created_at DESC")}
  # scope :ruby_on_rails_portfolio_items, ->{where(subtitle: "Ruby on Rails")}
  # Same as below:

  mount_uploader :main_image, PortfolioUploader
  mount_uploader :thumb_image, PortfolioUploader

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

end
