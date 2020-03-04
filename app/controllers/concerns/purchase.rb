module Purchase
  extend ActiveSupport::Concern

  def set_secret_key
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  end

  def set_card
    @card = Card.where(user_id: current_user.id).first if user_signed_in?
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
      redirect_to controller: "cards", action: "new", id: current_user.id
    end
  end

  def session_add(key)
    session[:"#{key}"] = true
  end

  def sesstion_chack(key)
    if session[:"#{key}"]
      session[:"#{key}"] = nil
    else
      redirect_to root_path
    end
  end
end