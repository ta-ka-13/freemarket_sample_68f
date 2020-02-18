class CategoriesController < ApplicationController
  # itemが使用可能になり次第、適用
  # before_action :set_item

  def index
    @categories = Category.all.order("id ASC")
  end

  def show
    @category = Category.find(params[:id])
  end

  # itemが使用可能になり次第、適用
  # def set_item
  #   @item = Item.find(params[:item_id])
  # end
end
