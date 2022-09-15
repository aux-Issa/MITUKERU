# frozen_string_literal: true

class CreateAssessableAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :assessable_areas do |t|
      t.references :shop, foreign_key: true
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
