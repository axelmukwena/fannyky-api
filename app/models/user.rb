class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :paintings
  has_many :painters
  has_many :exhibitions
  has_many :talks
  has_many :awards
  has_many :publications

  validates :email, presence: true, uniqueness: { case_sensitive: false }
end