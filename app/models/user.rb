class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :avatar, :phone, :lazy_id, :guest_account
  has_many :offers, :dependent => :destroy
  before_create :setup_default_role_for_new_users
  has_attached_file :avatar, 
    :styles => { 
      :medium_center => "300x300#",
      :medium => "300x300>", 
      :thumb => "100x100>" 
    }, 
    :default_url => "/images/avatar/:style/no-avatar.png",
    :storage => :s3,
    :bucket => 'roomnhouse-assets',
    :s3_credentials => {
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    },
    :url => ':s3_domain_url',
    :path => "/:class/:attachment/:id_partition/:style/:filename"

  ROLES = %w[admin default banned guest]

  validates_presence_of :firstname, :lastname, :phone
  validates_numericality_of :phone

  private

  def setup_default_role_for_new_users
    if self.role.blank?
      self.role = "default"
    end
  end
end
