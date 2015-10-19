class DetentionAttendance < ActiveRecord::Base
  belongs_to :staff_member
  has_many :detention_students
  has_many :students, through: :detention_students
end
