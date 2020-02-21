class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  belongs_to :user
  belongs_to :brand, optional: true
  belongs_to :category

  validates :name, :price, :description, :category, :condition, :shopping_charges, :shopping_area, :shopping_date, :commmission, :profit,  presence: true
  	
accepts_nested_attributes_for :images, allow_destroy: true
end
