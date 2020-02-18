class Item < ApplicationRecord
  has_many :images
  belongs_to :user
  belongs_to :brand, optional: true
  belongs_to :category

  validates :name, :price, :description, :category, :condition, :shopping_charges, :shopping_area, :shopping_date, presence: true
end
