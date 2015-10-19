class DetentionStudent < ActiveRecord::Base
  belongs_to :detention_attendance
  belongs_to :students
end
