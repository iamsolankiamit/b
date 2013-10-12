class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:facebook]
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :avatar, :phone, :lazy_id, :guest_account, :work_phone, :location, :about, :provider, :uid, :name
  attr_reader :avatar_remote_url
  has_many :checkouts
  has_many :offers, :dependent => :destroy
  has_many :trips
  before_create :setup_default_role_for_new_users
  has_attached_file :avatar, 
    :styles => { 
    :medium_center => "300x300#",
    :medium => "300x300>", 
    :thumb => "100x100>" 
  }, 
  :default_url => "/assets/avatar/no-avatar.jpg",
  :storage => :s3,
  :bucket => 'roomnhouse-assets',
  :s3_credentials => {
    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
  },
  url: ':s3_alias_url',
  s3_host_alias: 'dm1w09da1rt65.cloudfront.net', 
  :path => "/:class/:attachment/:id_partition/:style/:filename"

  ROLES = %w[admin default banned guest]
  def avatar_remote_url=(url_value)
    self.avatar = URI.parse(url_value)
    @avatar_remote_url = url_value
  end

  validates_presence_of :firstname
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:email => auth.info.email).first
    if(user&&!provider)
      user.update_attributes(provider:auth.provider,
                 uid:auth.id
                 )
      user.save!
    else
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(firstname:auth.extra.raw_info.first_name,
                         lastname:auth.extra.raw_info.last_name,
                         provider:auth.provider,
                         phone:auth.phone,
                         uid:auth.uid,
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20]
                        )
      user.avatar_remote_url=(auth.info.image)
      user.save!
    end
    end
    user
  end
  private

  def setup_default_role_for_new_users
    if self.role.blank?
      self.role = "default"
    end
  end
end
