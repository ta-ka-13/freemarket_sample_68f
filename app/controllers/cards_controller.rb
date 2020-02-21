class CardsController < ApplicationController
  require "payjp"
  include Purchase
  before_action :set_secret_key, only: [:destroy, :show, :create, :new]
  before_action :set_card, only: [:new, :destroy, :show]

  def new
    redirect_to action: "show" if @card.present?
  end

  def create
    if params["payjpToken"].present?
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params["payjpToken"],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "new", id: current_user.id
      end
    else
      redirect_to action: "new", id: current_user.id
    end
  end

  def destroy
    card_destroy(@card)
  end

  def show
    card_show(@card)
  end

  
  private
  def card_params
    params.require(:card).permit(:customer_id, :card_id).merge(user_id: current_user.id)
  end
  
  def set_secret_key
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  end
  
  def set_card
    @card = Card.where(user_id: current_user.id).first
  end
end