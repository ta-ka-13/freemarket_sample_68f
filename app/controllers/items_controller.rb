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

  def edit
    @item = Item.find(params[:id])
    @images = @item.images
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
  end

  def destroy
  end

  def purchase_confirmation
  end

  def purchase
  end

  private
  def item_params
    params.require(:item).permit( :name, :price, :description, :condition, :shopping_charges, :shopping_area, :shopping_data, :_id, :buyer, :user_id, :brand_id, :category_id, :created_at, :updated_at, )
    
    def update_params
      params.require(:item).permit( :name, :price, :description, :condition, :shopping_charges, :shopping_area, :shopping_data, :_id, :buyer, :user_id, :brand_id, :category_id, :created_at, :updated_at, )
    end
  end

end
