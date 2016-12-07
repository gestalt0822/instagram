class Photo < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  mount_uploader :picture, PictureUploader
  belongs_to :user
end
