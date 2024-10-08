class User < ApplicationRecord

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }
  has_many :books, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
 has_one_attached :profile_image

  
  
  def self.find_for_database_authentication(warden_conditions)
  conditions = warden_conditions.dup
  name = conditions.delete(:name)
  where(conditions).where(["name = :value OR email = :value", { value: name }]).first
 end
  
  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [100, 100]).processed
  end         
         
  validates :name, presence: true, uniqueness: true
end
