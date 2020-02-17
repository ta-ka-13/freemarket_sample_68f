class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order("id ASC")
  end

  def show
    @category = Category.find(params[:id])
  end
end
