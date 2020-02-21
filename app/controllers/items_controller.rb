class ItemsController < ApplicationController
  def index
  end

  def new
    # 仮置き
    @item = Item.new
    @item.images.new
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
  end

  def purchase_confirmation
  end

  def purchase
  end

  def searches

  # if params[:name].present?
    # @items = Item.where('name LIKE?', "%#{params[:name]}%")
  #   @items = Item.where('name LIKE?', "%#{params[:name]}%")
  #   else
  #     @items = Item.none
  #   # end
  #   # redirect_to root_path
  #   end
  # end

  
    @items = Item.search(params[:search]).limit(116)
    # @search = params[:search]


  end

  private
  # 仮置き
  def item_params
    params.require(:item).permit(:name, :price, images_attributes: [:src])
  end

end