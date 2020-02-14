require 'rails_helper'
describe Address do
  describe '#create' do

    # 1. 全ての項目が存在すれば登録できること
    it "is valid with all" do
      address = build(:address)
      expect(address).to be_valid
    end

    # 2. 送付先の苗字が空では登録できないこと
    it "is invalid without a destination_family_name" do
      address = build(:address, destination_family_name: nil)
      address.valid?
      expect(address.errors[:destination_family_name]).to include("can't be blank")
    end

    # 3. 送付先の名前が空では登録できないこと
    it "is invalid without a destination_last_name" do
      address = build(:address, destination_last_name: nil)
      address.valid?
      expect(address.errors[:destination_last_name]).to include("can't be blank")
    end

    # 4. 送付先の苗字（カナ）が空では登録できないこと
    it "is invalid without a destination_family_name_kana" do
      address = build(:address, destination_family_name_kana: nil)
      address.valid?
      expect(address.errors[:destination_family_name_kana]).to include("can't be blank")
    end

    # 5. 送付先の名前（カナ）が空では登録できないこと
     it "is invalid without a destination_last_name_kana" do
      address = build(:address, destination_last_name_kana: nil)
      address.valid?
      expect(address.errors[:destination_last_name_kana]).to include("can't be blank")
    end

    # 6. 都道府県が空では登録できないこと
    it "is invalid without a prefectures" do
      address = build(:address, prefectures: nil)
      address.valid?
      expect(address.errors[:prefectures]).to include("can't be blank")
    end

    # 7. 市区町村が空では登録できないこと
    it "is invalid without a municipalities" do
      address = build(:address, municipalities: nil)
      address.valid?
      expect(address.errors[:municipalities]).to include("can't be blank")
    end

    # 8. 番地が空では登録できないこと
    it "is invalid without an address" do
      address = build(:address, address: nil)
      address.valid?
      expect(address.errors[:address]).to include("can't be blank")
    end

    # 9. 郵便番号が空では登録できないこと

    # 10. 重複したphone_numberが存在する場合登録できないこと
    it "is invalid with a duplicate phone number" do
      address = create(:address)
      another_address = build(:address, phone_number: address.phone_number)
      another_address.valid?
      expect(another_address.errors[:phone_number]).to include("has already been taken")
    end

  end
end
