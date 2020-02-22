class ItemsController < ApplicationController
  require "payjp"
  include Purchase
  before_action :set_item, only: [:new, :edit, :update, :show, :purchase, :pay, :done]
  before_action :set_secret_key, only: [:purchase, :pay]
  before_action :set_card, only: [:purchase, :pay]

  def index
    @items = Item.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  def purchase
    if @card.present?
      card_data(@card)
    else
      redirect_to controller: "card", action: "new"
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

  private
  def item_params
    params.require(:item).permit(
      :name,
      :price,
      :description,
      :condition,
      :shopping_charges,
      :shopping_area,
      :shopping_date,
      :buyer,
      :brand_id,
      :category_id
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end