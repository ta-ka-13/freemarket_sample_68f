class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
    # 仮置き
    @item = Item.new(item_params)

  end

  def show
  end

  def update

  end

  def edit
  end

  def destroy
    item = Item.find(params[:id])
    if items.user_id == current_user.id
      item.destroy
    else
      
    end
    
  end

  def purchase_confirmation
  end

  def purchase
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, images_attributes: [:src])
  end

end
