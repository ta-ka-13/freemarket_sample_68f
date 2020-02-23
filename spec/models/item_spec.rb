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
    end
  end
end