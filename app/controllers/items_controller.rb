class ItemsController < ApplicationController
  def index
  end

  def new
    # 仮置き
    @item = Item.new
    @item.images.new
  end

  def create
    
    # 仮置き
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
    # Item.create(name: item_params[:name], price: item_params[:price], user_id: current_user.id)
  end

  def show
  end

  def update

  end

  def edit
  end

  def destroy

    # 出品機能完成したら実装
    # tweet = Tweet.find(params[:id])
    # if items.user_id == current_user.id
    # item.destroy
    # else

    item = Item.find(1)
    # if items.user_id == current_user.id
      item.destroy
    # else

    # end
    redirect_to root_path
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
