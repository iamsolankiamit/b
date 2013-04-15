class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :avatar
  # attr_accessible :title, :body
  has_many :offers, :dependent => :destroy
  before_create :setup_default_role_for_new_users
  has_attached_file :avatar,
    :storage => :s3,
    :bucket => 'roomnhouse-assets',
    :s3_credentials => {
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }

  ROLES = %w[admin default banned]

  private

  def setup_default_role_for_new_users
    if self.role.blank?
      self.role = "default"
    end
  end
end