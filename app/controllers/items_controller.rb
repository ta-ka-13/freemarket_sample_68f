class ItemsController < ApplicationController
  protect_from_forgery except: [:purchase, :pay]
  require "payjp"
  include Purchase
  before_action :set_item, only: [:new, :edit, :update, :show, :purchase]
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
      amount: 19800,
      customer: @card.customer_id,
      currency: "jpy"
    )
    redirect_to action: "done"
  end

  def done
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


  def set_card
    @card = Card.where(user_id: current_user.id).first
  end
end