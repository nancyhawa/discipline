class CreateStudentParents < ActiveRecord::Migration
  def change
    create_table :student_parents do |t|
      t.references :student, index: true
      t.references :parent, index: true

      t.timestamps null: false
    end
    add_foreign_key :student_parents, :students
    add_foreign_key :student_parents, :parents
  end
end
