class Topic < ApplicationRecord

  validates :title, presence: true, length: { minimum: 5 }

  has_many :blogs

end
