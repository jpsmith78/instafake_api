class Photo < ApplicationRecord

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :picture, presence: true
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }

end