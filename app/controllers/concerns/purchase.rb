module Purchase
  extend ActiveSupport::Concern

  def card_destroy(card)
    if card.present?
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
    redirect_to action: "new", id: current_user.id
  end

  def card_show(card)
    if card.present?
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    else
      redirect_to action: "new", id: current_user.id
    end
  end
end