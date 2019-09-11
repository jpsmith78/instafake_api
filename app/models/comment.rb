class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :photo
  validates :body, presence: true, length: { minimum: 3, maximum: 140 }
  validates_uniqueness_of :body
end
