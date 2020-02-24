class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :destination_family_name, :destination_last_name, :destination_family_name_kana, :destination_last_name_kana, :postal_code, :prefectures, :municipalities, :address, presence: true
  validates :phone_number, uniqueness: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
