class Post < ApplicationRecord
  validates :post, presence:true, length: { maximum:140 }
  mount_uploader :picture, PictureUploader
  belongs_to :user
end
