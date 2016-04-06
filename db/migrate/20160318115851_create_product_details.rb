class CreateProductDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :product_details do |t|
      t.integer  :product_id
      t.string   :colour
      t.string   :size

      t.timestamps
    end
  end
end
