class User < ApplicationRecord
  has_many :books
  has_many :reviews, dependent: :destroy
  has_many :upvotes
  # Include default devise modules. Others available are:
  #  :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable
  validates :username, presence: :true, uniqueness: {case_sensitive: false}
  validates :email, presence: :true, uniqueness: {case_sensitive: false}
  # may have 'member', 'admin' and 'inactive' roles, defaults to 'member'
  validates :role, presence: :true
  validates :encrypted_password, presence: :true
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  mount_uploader :avatar, AvatarUploader
  ratyrate_rater

  def admin?
    role == "admin"
  end

  def member?
    role == "member"
  end

  def inactive?
    role == "inactive"
  end

  def authorize_user
    if !user_signed_in || !current_user.admin?
      flash[:notice] = "You do not have access to this page."
      redirect_to root_path
    end
  end
end
