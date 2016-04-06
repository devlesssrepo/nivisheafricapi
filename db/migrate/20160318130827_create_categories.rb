class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string   :keyword, null:false
      t.integer  :segment, default:0

      t.timestamps
    end
  end
end
