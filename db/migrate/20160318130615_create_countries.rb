class CreateCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :countries do |t|
      t.string   :name, null:false
      t.string   :code, null:false
      t.string   :continent, default:'Africa'

      t.timestamps
    end
  end
end
