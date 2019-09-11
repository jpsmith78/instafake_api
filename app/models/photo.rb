class Photo < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :picture, presence: true
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true

end
