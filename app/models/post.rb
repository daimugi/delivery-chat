class Post < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 100 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 100, less_than_or_equal_to: 5000 }, length: { in: 3..4 }
  validates :hundred, presence: true
  private 
  
  def hundred
    price.to_i % 100 == 0
  end  
end
