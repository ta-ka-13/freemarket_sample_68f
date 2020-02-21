module Purchase
  extend ActiveSupport::Concern

  def set_secret_key
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  end

  def set_card
    @card = Card.where(user_id: current_user.id).first
  end

  def card_destroy(card)
    if card.present?
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
    redirect_to action: "new", id: current_user.id
  end

  def card_data(card)
    if card.present?
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    else
      redirect_to action: "new", id: current_user.id
    end
  end
end