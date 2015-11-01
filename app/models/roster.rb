class Roster < ActiveRecord::Base
  belongs_to :staff
  has_many :roster_students
  has_many :students, through: :roster_students

  def update_students(student_ids)
    remove_students(student_ids)
    add_students(student_ids)
  end

  def remove_students(student_ids)
    student_ids.map! {|id| id.to_i }
    students.each do |student|
      students.delete(student) unless student_ids.include?(student.id)
      save
    end
  end

  def add_students(student_ids)
    student_ids.each do |student_id|
      current_student = Student.find(student_id)
      self.students << current_student unless self.students.include?(current_student)
      save
    end
  end
end
