class AddJoinTypeToGroupUser < ActiveRecord::Migration
  def change
    add_column :group_users, :join_type, :integer
  end
end
