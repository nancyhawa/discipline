class StaffMember < ActiveRecord::Base
  belongs_to :school
  has_many :roster
  has_many :students, through: :rosters
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def create_by_admin(email, school_id)
    generated_password = Devise.friendly_token.first(8)
    user = User.create!(:email => email, :password => generated_password, school_id: school_id)
    RegistrationMailer.welcome(user, generated_password).deliver
  end

end
