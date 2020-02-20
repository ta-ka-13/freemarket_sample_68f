class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :family_name, :last_name, :family_name_kana, :last_name_kana, :birth_year, :birth_month, :birth_day ,presence: true
  VALID_EMAIL_REGEX = /\A[\x21-\x3f\x41-\x7e]+@(?:[-a-z0-9]+\.)+[a-z]{2,}\z/i
  kana = /\A([ァ-ン]|-)\z/
  validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}
  validates :family_name_kana, presence: true, format: {with: kana}
  validates :last_name_kana, presence: true, format: {with: kana}
  has_one :address
  has_many :items
  has_one :card
end