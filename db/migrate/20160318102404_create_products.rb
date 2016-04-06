class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer  :category_id, null:false
      t.integer  :collection_id, null:false
      t.string   :label, null:false
      t.string   :description
      t.string   :code, null:false
      t.decimal  :unit_price, precision:6, scale:2, null:false
      t.integer  :size_id, null:false
      t.integer  :colour_id, null:false
      t.float    :weight
      t.integer  :quantity_total
      t.integer  :quantity_sold
      t.boolean  :is_available, default:true
      t.string   :pictures, null:false, array:true
      t.boolean  :is_featured, default:false

      t.timestamps
    end
  end
end
