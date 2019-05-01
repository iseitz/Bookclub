class User < ApplicationRecord
  has_many :books
  has_many :reviews
  # Include default devise modules. Others available are:
  #  :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable 
end
