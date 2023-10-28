class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :user_name, presence: true, uniqueness: true 
  
  enum access_level: { user: 0, admin: 1 } 
  
  after_initialize :set_default_access_level

  private

  def set_default_access_level
    self.access_level ||= :user
  end
end
