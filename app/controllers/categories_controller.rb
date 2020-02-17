class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order("id ASC")
  end

  def show
  end
end
