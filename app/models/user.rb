class User < ActiveRecord::Base
  include Security
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :rememberable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :trackable, :validatable

  has_many :lists
end
