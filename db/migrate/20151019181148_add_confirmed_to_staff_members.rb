class AddConfirmedToStaffMembers < ActiveRecord::Migration
  def change
    add_column :staff_members, :confirmed?, :boolean
  end
end
