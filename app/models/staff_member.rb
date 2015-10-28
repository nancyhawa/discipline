class StaffMember < ActiveRecord::Base
  belongs_to :school
  has_many :roster
  has_many :students, through: :rosters
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
