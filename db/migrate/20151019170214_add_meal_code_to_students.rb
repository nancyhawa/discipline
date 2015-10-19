class AddMealCodeToStudents < ActiveRecord::Migration
  def change
    add_column :students, :meal_code, :integer
  end
end
