class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.integer :mailbox_id
      t.integer :sender_id
      t.integer :reply_id
      t.string :subject
      t.boolean :spam, default: false
      t.timestamps
    end
  end
end
