class List < ActiveRecord::Base
  validates :name, presence: true
  validates :user_id, presence: true
  
  belongs_to :user
  has_many :todos, :dependent => :delete_all
end
