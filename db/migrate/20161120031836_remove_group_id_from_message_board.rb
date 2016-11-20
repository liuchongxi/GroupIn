class RemoveGroupIdFromMessageBoard < ActiveRecord::Migration
  def change
    remove_column :message_boards, :group_id, :integer
  end
end
