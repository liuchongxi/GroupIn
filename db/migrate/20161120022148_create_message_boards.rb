class CreateMessageBoards < ActiveRecord::Migration
  def change
    create_table :message_boards do |t|
      t.string :sender
      t.string :group_name
      t.string :message
      t.integer :user_id
      t.integer :group_id

      t.timestamps null: false
    end
  end
end
