class User < ActiveRecord::Base
  has_many :collections
  has_and_belongs_to_many :meetups
  has_many :available_boardgames
  has_many :approvals

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :openid_authenticatable

  make_voter

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :identity_url, :bgg_username

  def self.build_from_identity_url(identity_url)
    User.new(:identity_url => identity_url, :password => Devise.friendly_token[0,20])
  end
  
  def self.openid_required_fields
    ["email", "http://axschema.org/contact/email"]
  end

  def openid_fields=(fields)
    fields.each do |key, value|
      # Some AX providers can return multiple values per key
      if value.is_a? Array
        value = value.first
      end

      case key.to_s
      when "email", "http://axschema.org/contact/email"
        self.email = value
      else
        logger.error "Unknown OpenID field: #{key}"
      end
    end
  end

end
