class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :firstname
      t.string :lastname
      t.integer :owner_id
      t.integer :friend_id
      t.timestamps
    end
  end
end
