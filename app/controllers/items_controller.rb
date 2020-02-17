class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @group.save
      redirect_to root_path
    else
      render :new
    end
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

  private
  def item_params
    params.require(:item).permit(:name)
  end
  
end
