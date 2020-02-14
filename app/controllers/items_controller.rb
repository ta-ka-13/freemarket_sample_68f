class ItemsController < ApplicationController
  def index
    @items = item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    if @item.save
    redirect_to "/item", notice: 商品を登録しました
    else
      
  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
  end
  
end
