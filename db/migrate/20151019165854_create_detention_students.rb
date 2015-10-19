class CreateDetentionStudents < ActiveRecord::Migration
  def change
    create_table :detention_students do |t|
      t.references :detention_attendance, index: true
      t.references :students, index: true

      t.timestamps null: false
    end
    add_foreign_key :detention_students, :detention_attendances
    add_foreign_key :detention_students, :students
  end
end
