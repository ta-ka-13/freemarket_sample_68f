class Image < ApplicationRecord
  belongs_to :item
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  before_destroy :remove_image

  def remove_image
    image.remove!
  rescue Exception => e
    logger.error(e.message)
  end
end
