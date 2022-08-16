class Post < ApplicationRecord
  validates :post, presence:true, length: { maximum:140 }
  mount_uploader :picture, PictureUploader

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  belongs_to :user
end
