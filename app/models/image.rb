class Image < ApplicationRecord
  belongs_to :item, dependent: :destroy, optional: true
  mount_uploader :image, ImageUploader
  validates :image, presence: true
end
