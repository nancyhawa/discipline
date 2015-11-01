class ChangeRosterStaffIdToStaffMemberId < ActiveRecord::Migration
  def change
    rename_column :rosters, :staff_id, :staff_member_id
  end
end
