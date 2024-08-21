class UpdateProductsTable < ActiveRecord::Migration[7.1]
  def change
    change_column :products, :price, :decimal, precision: 10, scale: 2
    change_column_default :products, :visible, from: nil, to: false
  end
end
