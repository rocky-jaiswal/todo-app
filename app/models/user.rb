class User < ActiveRecord::Base
  include Security
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :rememberable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :validatable

  has_many :lists
end
