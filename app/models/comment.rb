class Comment < ApplicationRecord
  belongs_to :prototype
  belongs_to :user

  validates :coment, presence: true
  
end
