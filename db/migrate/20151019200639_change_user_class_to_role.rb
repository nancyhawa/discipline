class ChangeUserClassToRole < ActiveRecord::Migration
  def change
    rename_column :staff_members, :user_class, :role
  end
end
