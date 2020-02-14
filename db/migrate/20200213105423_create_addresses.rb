class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user
      t.string :destination_family_name,        null: false
      t.string :destination_last_name,          null: false
      t.string :destination_family_name_kana,   null: false
      t.string :destination_last_name_kana,     null: false
      t.string :prefectures,                    null: false
      t.string :municipalities,                 null: false
      t.string :address,                        null: false
      t.string :building
      t.bigint :phone_number,                  unique: true
      t.timestamps
    end
  end
end
