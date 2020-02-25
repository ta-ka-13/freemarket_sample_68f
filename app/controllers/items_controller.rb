class ItemsController < ApplicationController
  protect_from_forgery except: :search 
  before_action :set_parents, only: [:new, :create, :edit, :update]

  def index
    @categories = Category.all
    @items = Item.all.order("id DESC").limit(12)
  end

  def new
    @item = Item.new
    @item.images.new
    @parents = Category.where(ancestry: nil)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.images.new
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
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
    if @item.destroy
      redirect_to root_path
    else
      alert("削除に失敗しました。")
    end
  end

  def purchase_confirmation
  end

  def purchase
  end

  def search
    if params[:parent_form]
      @childform = Category.find(params[:parent_form]).children
    elsif params[:childform]
      @grandhchildform = Category.find(params[:childform]).children
    end
    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :ancestry, :condition, :shopping_charges, :prefecture_id, :shopping_date, :category_id, :commission, :profit, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end
end
