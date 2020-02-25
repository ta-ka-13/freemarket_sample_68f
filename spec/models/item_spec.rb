require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with all' do
        expect(build(:item, :item_with_image)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without image' do
        item = build(:item)
        item.valid?
        expect(item.errors[:images]).to include("を入力してください")
      end

      it 'is invalid without category' do
        item = build(:item, :item_with_image, category: nil )
        item.valid?
        expect(item.errors[:category]).to include("を入力してください")
      end

      it 'is invalid without name' do
        item = build(:item, :item_with_image, name: nil )
        item.valid?
        expect(item.errors[:name]).to include("を入力してください")
      end

      it 'is invalid without price' do
        item = build(:item, :item_with_image, price: nil )
        item.valid?
        expect(item.errors[:price]).to include("を入力してください")
      end

      it 'is invalid without description' do
        item = build(:item, :item_with_image, description: nil )
        item.valid?
        expect(item.errors[:description]).to include("を入力してください")
      end

      it 'is invalid without condition' do
        item = build(:item, :item_with_image, condition: nil )
        item.valid?
        expect(item.errors[:condition]).to include("を入力してください")
      end

      it 'is invalid without shopping_charges' do
        item = build(:item, :item_with_image, shopping_charges: nil )
        item.valid?
        expect(item.errors[:shopping_charges]).to include("を入力してください")
      end

      it 'is invalid without prefecture' do
        item = build(:item, :item_with_image, prefecture_id: nil )
        item.valid?
        expect(item.errors[:prefecture_id]).to include("を入力してください")
      end

      it 'is invalid without shopping_date' do
        item = build(:item, :item_with_image, shopping_date: nil )
        item.valid?
        expect(item.errors[:shopping_date]).to include("を入力してください")
      end

      it 'is invalid without login' do
        item = build(:item, :item_with_image, user: nil )
        item.valid?
        expect(item.errors[:user]).to include("を入力してください")
      end
    end
  end
end