# frozen_string_literal: true

class AddIndexToShop < ActiveRecord::Migration[7.0]
  def change
    add_index :shops, :ieul_shop_id, unique: true
  end
end
