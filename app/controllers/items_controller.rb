class ItemsController < ApplicationController
  protect_from_forgery except: :search 
  before_action :set_parents, only: [:new, :create, :edit, :update]

  def index
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
    @item.destroy
    redirect_to root_path
  end

  def purchase_confirmation
    
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
    params.require(:item).permit(:name, :price, :description, :ancestry, :condition, :shopping_charges, :shopping_area, :shopping_date, :category_id, :commission, :profit, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end
end
