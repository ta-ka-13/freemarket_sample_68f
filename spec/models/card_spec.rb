require 'rails_helper'

RSpec.describe Card, type: :model do
  describe "#create" do
    context "can save" do
      it "is valid with all" do
        expect(build(:card)).to be_valid
      end
    end

    context "can't save" do
      it "is invalid without customer_id" do
        card = build(:card, customer_id: nil)
        card.valid?
        expect(card.errors[:customer_id]).to include("を入力してください")
      end

      it "is invalid without card_id" do
        card = build(:card, card_id: nil)
        card.valid?
        expect(card.errors[:card_id]).to include("を入力してください")
      end

      it "is invalid without user" do
        card = build(:card, user: nil)
        card.valid?
        expect(card.errors[:user]).to include("を入力してください")
      end

      it "is invalid duplication customer_id" do
        card = create(:card)
        a_card = build(:card, customer_id: card.customer_id)
        a_card.valid?
        expect(a_card.errors[:customer_id]).to include("はすでに存在します")
      end

      it "is invalid duplication card_id" do
        card = create(:card)
        a_card = build(:card, card_id: card.card_id)
        a_card.valid?
        expect(a_card.errors[:card_id]).to include("はすでに存在します")
      end
    end
  end
end
