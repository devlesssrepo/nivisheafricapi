class RemoveColumnSizeColourFromProduct < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :size_id
    remove_column :products, :colour_id
  end
end
