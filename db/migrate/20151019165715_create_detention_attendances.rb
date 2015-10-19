class CreateDetentionAttendances < ActiveRecord::Migration
  def change
    create_table :detention_attendances do |t|
      t.date :date
      t.references :staff_member, index: true

      t.timestamps null: false
    end
    add_foreign_key :detention_attendances, :staff_members
  end
end
