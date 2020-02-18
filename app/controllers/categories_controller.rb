class CategoriesController < ApplicationController
  # before_action :set_item

  def index
    @categories = Category.all.order("id ASC")
  end

  def show
    @category = Category.find(params[:id])
  end

  # def set_item
  #   @item = Item.find(params[:item_id])
  # end
end
