class CreateMailBoxes < ActiveRecord::Migration
  def change
    create_table :mail_boxes do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.timestamps
    end
  end
end
