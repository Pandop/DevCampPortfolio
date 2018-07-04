class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,   :registerable,
         :recoverable, :rememberable, :trackable,   :validatable

  validates :name, presence:true 

  def first_name
    return self.name.split.first 
  end

  def last_name
    return self.name.split.last
  end

end
