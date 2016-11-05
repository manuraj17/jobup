class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  has_many :jobs, dependent: :nullify

  def self.from_omniauth(auth)
    # where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
    #   puts auth
    #   user.provider = auth.provider
    #   # user.uid      = auth['info']['user_id']
    #   user.email    = auth['info']['email']
    #   user.name     = auth['info']['name']
    #   user.avatar   = auth['info']['image']
    #   user.password = Devise.friendly_token[0,20]
    # end

    # TODO: Find an elegant solution for below update
    # Made the following change that user object gets updated on login
    # This may turn out costly as each login requires a database write.
    where( provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.password = Devise.friendly_token[0,20]
    end.update(
      email:  auth['info']['email'],
      name:   auth['info']['name'],
      avatar: auth['info']['image']
    )
    User.where(uid: auth.uid).first
  end
end
