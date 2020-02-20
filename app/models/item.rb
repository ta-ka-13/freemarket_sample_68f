class Item < ApplicationRecord
  has_many :images
  belongs_to :user
  belongs_to :brand, optional: true
  belongs_to :category

  validates :name, :price, :description, :condition, :shopping_charges, :shopping_area, :shopping_date, presence: true
  has_ancestry
  accepts_nested_attributes_for :images, allow_destroy: true
end
