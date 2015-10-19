class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :osis_number
      t.integer :grade

      t.timestamps null: false
    end
    add_index :students, :last_name
  end
end
