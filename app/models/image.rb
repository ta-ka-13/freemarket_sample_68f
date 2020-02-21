class Image < ApplicationRecord
  belongs_to :item, dependent: :destroy
  mount_uploader :src, ImageUploader
  mount_uploader :image, ImageUploader
end
