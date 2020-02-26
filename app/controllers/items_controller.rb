class ItemsController < ApplicationController
  require "payjp"
  include Purchase
  protect_from_forgery except: :search
  before_action :set_item, only: [:edit, :update, :destroy, :show, :purchase, :pay, :done]
  before_action :set_parents, only: [:index, :new, :create, :edit, :update]
  before_action :set_secret_key, only: [:purchase, :pay]
  before_action :set_card, only: [:purchase, :pay]

  def index
    @items = Item.includes(:images).order("id DESC")
    @ladies = Item.includes(:images).where(category_id: 1..198).order("id DESC").limit(3)
    @mens = Item.includes(:images).where(category_id: 199..343).order("id DESC").limit(3)
    @appliances = Item.includes(:images).where(category_id: 892..977).order("id DESC").limit(3)
    @goods = Item.includes(:images).where(category_id: 679..791).order("id DESC").limit(3)
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to exhibition_item_path(:id)
    else
      @item.images.new
      render :new
    end
  end

  def edit
    @images = @item.images
  end

  def update
    @item.update(item_params)
    redirect_to item_path(params[:id])
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      alert("削除に失敗しました。")
    end
  end

  def show
  end

  def purchase
    if @card.present?
      card_data(@card)
    else
      redirect_to new_card_path
    end
  end

  def pay
    Payjp::Charge.create(
      amount: @item.price,
      customer: @card.customer_id,
      currency: "jpy"
    )
    if @item.update_attribute(:buyer, current_user.id)
      session_add("Pay")
      redirect_to action: "done"
    else
      redirect_to root_path
    end
  end

  def done
    sesstion_chack("Pay")
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
    params.require(:item).permit(:name, :price, :description, :ancestry, :condition, :brand, :shopping_charges, :prefecture_id, :shopping_date, :category_id, :commission, :profit, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end
end