class Todo < ActiveRecord::Base
  validates :title, presence: true
  validates :list_id, presence: true
  
  belongs_to :list

  delegate :user, to: :list
end
