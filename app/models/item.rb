class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  belongs_to :user
  belongs_to :brand, optional: true
  belongs_to :category
  	
  accepts_nested_attributes_for :images, allow_destroy: true
  validates_associated :images
  validates :images, :name, :description, :condition, :shopping_charges, :shopping_area, :shopping_date, :price, presence: true
  has_ancestry
  accepts_nested_attributes_for :images, allow_destroy: true
end
