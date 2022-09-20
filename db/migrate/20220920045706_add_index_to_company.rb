class AddIndexToCompany < ActiveRecord::Migration[7.0]
  def change
    add_index :companies, :ieul_company_id, unique: true
  end
end
