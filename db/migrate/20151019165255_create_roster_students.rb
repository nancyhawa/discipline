class CreateRosterStudents < ActiveRecord::Migration
  def change
    create_table :roster_students do |t|
      t.references :roster, index: true
      t.references :student, index: true

      t.timestamps null: false
    end
    add_foreign_key :roster_students, :rosters
    add_foreign_key :roster_students, :students
  end
end
