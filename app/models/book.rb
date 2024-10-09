class Book < ApplicationRecord
  
  # バリデーション
  
  # アソシエーション
  belongs_to :user
  
end
