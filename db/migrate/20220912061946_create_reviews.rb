class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :shop, foreign_key: true
      t.references :city, foreign_key: true

      t.string :remaining_address, null: false
      t.integer :type_of_property, null: false
      t.integer :times_of_sales, null: false
      t.date :sale_consideration_date, null: false
      t.date :assessment_request_date, null: false
      t.date :sale_date, null: false
      t.date :sold_out_date, null: false
      t.date :delivery_date, null: false
      t.integer :gender, null: false
      t.integer :age, null: false
      t.integer :assessment_price, null: false
      t.integer :sale_price, null: false
      t.integer :required_months_after_discount
      t.integer :discount_price
      t.integer :contract_price, null: false
      t.integer :contract_category, null: false
      t.string :title, null: false
      t.integer :reason_for_sales, null: false
      t.text :concern_at_sales, null: false
      t.text :reason_for_selection, null: false
      t.integer :response_satisfaction, null: false
      t.text :reason_for_response_satisfaction, null: false
      t.text :advice, null: false
      t.text :improvement_point

      t.timestamps
    end
  end
end
