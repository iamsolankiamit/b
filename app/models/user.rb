class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:facebook]
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :avatar, :phone, :lazy_id, :guest_account, :work_phone, :location, :about, :provider, :uid, :name, :confirmed_at, :bank_name, :ifsc_code, :bank_branch, :account_no ,:age ,:gender, :income, :education ,:occupation, :family_status


  
  attr_reader :avatar_remote_url
  has_many :checkouts
  has_many :offers, :dependent => :destroy
  has_many :trips
  has_many :messages
  before_create :setup_default_role_for_new_users
  has_attached_file :avatar,
    :styles => {
    :medium_center => "300x300#",
    :medium => "300x300>",
    :thumb => "100x100>",
    :thumb2 => "100x100#"
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

  validates_attachment_content_type :avatar, :content_type => /\Aimage/

  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]

  ROLES = %w[admin default banned guest]
  def avatar_remote_url=(url_value)
    self.avatar = URI.parse(url_value)
    @avatar_remote_url = url_value
  end

  validates_presence_of :firstname

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.firstname = auth.info.name   # assuming the user model has a name
      url = URI.parse(auth.info.image)

      h = Net::HTTP.new url.host, url.port
      h.use_ssl = url.scheme == 'https'

      head = h.start do |u|
          u.head url.path
      end

      new_url = head['location']
      user.avatar = new_url # assuming the user model has an image
    end
  end

  def self.new_with_session(params,session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def complete_name
    "#{firstname} #{lastname}"
  end

  private

  def setup_default_role_for_new_users
    if self.role.blank?
      self.role = "default"
    end
  end
end
