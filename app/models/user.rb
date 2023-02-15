class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :pictures, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_pictures, through: :favorites, source: :picture
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true ,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  def already_favorited?(picture)
    self.favorites.exists?(picture_id: picture.id)
  end
end
