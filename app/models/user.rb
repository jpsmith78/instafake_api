class User < ApplicationRecord
  has_many :photos, dependent: :destroy
  has_many :likes, dependent: :destroy
  before_save { self.email = email.downcase}

  validates :username, presence: true,
    uniqueness: { case_sensitive: false },
    length: {minimum: 3, maximum: 25}
  validates :email,
    presence: true,
    length: { maximum: 105},
    uniqueness: { case_sensitive: false }
  validates :image,
    presence: true
    has_secure_password
end
