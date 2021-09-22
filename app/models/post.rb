class Post < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 100 }
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
