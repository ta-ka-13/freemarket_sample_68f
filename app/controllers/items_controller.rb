class ItemsController < ApplicationController
  def index
    @categories = Category.all
    @items = Item.all.order("id DESC").limit(12)
  end

  def new
  end

  def create
  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def purchase_confirmation
    
  end

end
