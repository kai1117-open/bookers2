class Book < ApplicationRecord
  
  # バリデーション
  validates :title, presence: true
  validates :body, presence: true
  # アソシエーション
   belongs_to :user
  
end
