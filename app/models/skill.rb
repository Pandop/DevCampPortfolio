class Skill < ApplicationRecord

  validates :title, presence: true, length: { minimum: 5}

  validates :body, :percent_completed, presence: true
  
end
