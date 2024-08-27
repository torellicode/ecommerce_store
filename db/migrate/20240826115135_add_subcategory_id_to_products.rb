class AddSubcategoryIdToProducts < ActiveRecord::Migration[7.1]
  def change
    add_reference :products, :subcategory, null: false, foreign_key: { to_table: :categories }
  end
end
