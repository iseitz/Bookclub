class User < ApplicationRecord
  has_many :books
  has_many :reviews
  # Include default devise modules. Others available are:
  #  :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable
  validates :username, presence: :true, uniqueness: {case_sensitive: false}
  validates :email, presence: :true, uniqueness: {case_sensitive: false}
  validates :role, presence: :true
  validates :encrypted_password, presence: :true
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  def admin?
    role == "admin"
  end

  def authorize_user
    if !user_signed_in || !current_user.admin?
      flash[:notice] = "You do not have access to this page."
      redirect_to root_path
    end
  end
end
