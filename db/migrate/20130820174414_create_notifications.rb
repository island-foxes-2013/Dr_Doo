class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :form_id
      t.string :recipient_email
      t.integer :sender_id
      t.boolean :completed, default: false
      
      t.timestamps
    end
  end
end
