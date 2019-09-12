class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :photo
  validates :body, presence: true, length: { minimum: 3, maximum: 300 }
end
