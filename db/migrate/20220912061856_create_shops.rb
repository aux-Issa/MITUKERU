# frozen_string_literal: true

class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.references :company, foreign_key: true
      t.references :city, foreign_key: true

      t.bigint :ieul_shop_id, null: false
      t.string :postal_code
      t.string :name, null: false
      t.text :catch_copy, null: false
      t.string :remaining_address, null: false
      t.string :telephone_number
      t.string :fax_number
      t.string :opening_hour
      t.string :holiday
      t.text :introduction, null: false
      t.text :logo_url, null: false

      t.timestamps
    end
  end
end
