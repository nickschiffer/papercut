class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_save { self.first_name = first_name[0,1].upcase + first_name[1,first_name.length]}
  before_save { self.last_name = last_name[0,1].upcase + last_name[1,last_name.length]}
  before_save { self.email = email.downcase }

  VALID_FIRST_NAME = /\A[a-z ]+\z/i
  VALID_LAST_NAME = /\A[a-z ]+\z/i

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  validates_presence_of     :email
  validates_uniqueness_of   :email,     :case_sensitive => false, :allow_blank => false, :if => :email_changed?
  validates_format_of       :email,    :with  => Devise.email_regexp, :allow_blank => true, :if => :email_changed?
  validates_presence_of     :password, :on=>:create
  validates_confirmation_of :password, :on=>:create
  validates_length_of       :password, :within => Devise.password_length, :allow_blank => true
  validates_presence_of     :first_name
  validates_presence_of     :last_name
  validates :first_name, allow_blank: true, length: { minimum: 2, maximum: 16 }, format: { with: VALID_FIRST_NAME }
  validates :last_name, allow_blank: true, length: { minimum: 2, maximum: 16 }, format: { with: VALID_LAST_NAME }
  
  has_many :posts, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :sales, dependent: :destroy
  has_many :payments, dependent: :destroy
end
