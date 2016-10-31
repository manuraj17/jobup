class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  def self.from_omniauth(auth)
    # byebug
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      puts auth
      user.provider = auth.provider
      user.uid      = auth['info']['user_id']
      user.email    = auth['info']['email']
      user.password = Devise.friendly_token[0,20]
    end
  end
end
