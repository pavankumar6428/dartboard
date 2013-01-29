class User < ActiveRecord::Base

  has_many :campaigns
  has_many :impressions
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :phonenumber,:name, :company, :jb_membership, :total_impressions
  # attr_accessible :title, :body

  validates :name, :presence => true
  validates :jb_membership, :presence =>true
  before_save :set_defaults


  def set_defaults
    self.total_impressions = 0
  end

end
