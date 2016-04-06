class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.string   :name, null:false
      t.integer  :designer_id, null:false
      t.boolean  :is_available, default:true

      t.timestamps
    end
  end
end
