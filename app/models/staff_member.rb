class StaffMember < ActiveRecord::Base
  belongs_to :school
  has_many :rosters
  has_many :students, through: :rosters

  validates :email, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.new_from_admin(email, school_id, admin = false)
    generated_password = Devise.friendly_token.first(8)
    user = StaffMember.new(:email => email, :password => generated_password, school_id: school_id, admin: admin)
    # RegistrationMailer.welcome(user, generated_password).deliver
  end

end
