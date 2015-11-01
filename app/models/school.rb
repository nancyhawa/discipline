class School < ActiveRecord::Base
  has_many :students
  has_many :staff_members
  has_many :rosters, through: :staff_members

  def grades
    students.map {|s| s.grade }.uniq.sort
  end
end
