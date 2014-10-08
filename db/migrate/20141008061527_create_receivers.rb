class CreateReceivers < ActiveRecord::Migration
  def change
    create_table :receivers do |t|
      t.integer :email_id
      t.integer :mailbox_id
      t.timestamps
    end
  end
end
