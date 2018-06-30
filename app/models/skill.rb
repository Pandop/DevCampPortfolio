class Skill < ApplicationRecord

  validates :title, presence: true, length: { minimum: 5}

  validates :percent_completed, presence: true

end
