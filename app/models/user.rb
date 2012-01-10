class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :confirmable
  has_one :company, :dependent => :destroy
  has_one :user_detail, :dependent => :destroy
  has_many :cvs, :dependent => :destroy
  accepts_nested_attributes_for :company, :allow_destroy => true
  accepts_nested_attributes_for :user_detail, :allow_destroy => true


  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :username, :email, :password, :password_confirmation, :remember_me, :company_attributes, :user_detail_attributes


  def password_required?
    provider.nil? ? super : (provider.empty?) && super
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if session["devise.vkontakte_data"] && session["devise.vkontakte_data"]["extra"]["user_hash"]
        data = session['devise.vkontakte_data']
        user.username = data['user_info']['name']
        user.provider = data['provider']
        user.uid = data['uid']
      end
    end
  end

  # @return [User]
  def self.find_for_vkontakte_oauth(access_token, signed_in_resource=nil)
    data = access_token
    if user = User.find_by_uid(data['uid'])
      user
    else # register a new user with stup passwd. Nice, yeh?
      User.create(:password => Devise.friendly_token[0, 20], :provider => data[:provider])
    end
  end

  # @return [User]
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.where(:email => data.email).first
      user
    else # Create a user with a stub password.
      User.create!(:email => data.email, :password => Devise.friendly_token[0, 20])
    end
  end

  def is_company?
    company ? true : false
  end

  def have_user_detail?
    return false unless user_detail
    !user_detail.first_name.nil? && !user_detail.last_name.nil?
  end

end
