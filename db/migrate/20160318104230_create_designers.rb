class CreateDesigners < ActiveRecord::Migration[5.0]
  def change
    create_table :designers do |t|
      t.string   :design_label, null:false
      t.string   :first_name, null:false
      t.string   :last_name
      t.string   :phone_number, null:false
      t.string   :email_address, null:false
      t.string   :physical_address
      t.integer  :country_id
      t.string   :logo
      t.string   :about_notes
      t.string   :size_url
      t.string   :password_digest
      t.string   :activation_digest
      t.string   :reset_digest
      t.boolean  :activated, default:false
      t.boolean  :admin, default:false
      t.datetime :activated_at
      t.datetime :reset_sent_at

      t.timestamps
    end
  end
end
