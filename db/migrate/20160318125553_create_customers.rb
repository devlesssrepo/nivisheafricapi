class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string   :first_name
      t.string   :last_name
      t.string   :email_address, null:false
      t.string   :phone_number, null:false
      t.string   :activation_digest
      t.boolean  :activated, default:false
      t.string   :password_digest
      t.string   :reset_digest
      t.datetime :activated_at
      t.datetime :reset_sent_at
      t.string   :shipping_address
      t.integer  :country_id
      t.string   :stripe_card_token

      t.timestamps
    end
  end
end
