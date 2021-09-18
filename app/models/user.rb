class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :introduction, length: { maximum: 100 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  mount_uploader :image, ImageUploader
  
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
