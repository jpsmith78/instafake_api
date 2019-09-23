class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :photo
  has_many :comment_likes, dependent: :destroy
  validates :body, presence: true, length: { minimum: 3, maximum: 300 }
end
