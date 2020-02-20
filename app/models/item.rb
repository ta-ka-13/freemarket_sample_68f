class Item < ApplicationRecord
  has_many :images
  belongs_to :user
  belongs_to :brand, optional: true
  belongs_to :category


  # def self.search(search)
  #   if search
  #     Item.where(['name LIKE ?', "%#{name}%"])
  #   else
  #     Item.all
  #   end
  # end

  def self.search(search)

    if search

    # return Item.all unless search
    Item.where(['name LIKE ?', "%#{search}%"])

  else
    Item.none
    redirect_to root_path

  end

end
end
