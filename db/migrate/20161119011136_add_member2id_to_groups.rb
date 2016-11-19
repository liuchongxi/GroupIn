class AddMember2idToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :member2id, :integer
  end
end
