class User < ActiveRecord::Base
  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :async,
         :omniauthable, :omniauth_providers => [:facebook, :twitter, :instagram]

  has_one :dashboard
  has_one :mixfeed
  has_many :identities
  has_one :facebook_page

  before_validation :validate_full_name

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  after_create :create_dashboard, :create_mixfeed

  def self.find_for_oauth(auth, signed_in_resource = nil)
    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : identity.user

    # Create the user if needed
    if user.nil?
      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = if auth.provider == "facebook"
                            auth.info.email.present?
                          else
                            auth.info.email && (auth.info.verified || auth.info.verified_email)
                          end
      email = auth.info.email if email_is_verified
      user = User.where(:email => email).first if email

      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
          first_name: auth.info.first_name,
          last_name: auth.info.last_name,
          full_name: auth.info.name,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20],
          image: auth.info.image
        )
        # Skip confirmation for OAuth if confirmable
        user.skip_confirmation!
        user.save!
      end
    else
      # Update the user's attributes from the new OAuth
      user.update_attributes({
        first_name: auth.info.first_name,
        last_name: auth.info.last_name,
        full_name: auth.info.name,
        image: auth.info.image
      })
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end
    identity.check_for_account(auth)
    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end

  def facebook_account
    identities.facebook.present? ? identities.facebook.first.facebook_account : nil
  end

  def facebook_pages
    facebook_account.present? ?
    facebook_account.facebook_pages : nil
  end

  def twitter_account
    identities.twitter.present? ? identities.twitter.first.twitter_account : nil
  end

  def instagram_account
    identities.instagram.present? ? identities.instagram.first.instagram_account : nil
  end

  def linkedin_account
    identities.linkedin.present? ? identities.linkedin.first.linkedin_account : nil
  end

  private

  def validate_full_name
    if full_name.nil?
      update_attribute("full_name", "#{first_name} #{last_name}")
    end
  end

end
