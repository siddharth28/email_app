class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :sender
      t.integer :receiver_count
      t.timestamps
    end
  end
end
