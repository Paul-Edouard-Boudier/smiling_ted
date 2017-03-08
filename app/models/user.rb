class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :chapters
  has_many :teds
  has_many :photos, through: :chapters

  has_attachment  :avatar, accept: [:jpg, :png, :gif]
  has_attachments :photos, maximum: 5

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:avatar_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def name
    "#{first_name} #{last_name}"
  end

  def avatar_image_url
    if avatar.present?
      avatar.path
    else
      'http://cdn.perfectmemorials.com/product_images/3673837/lg/3415.brownteddybearcr_lrg_0.jpg'
    end
  end
end
