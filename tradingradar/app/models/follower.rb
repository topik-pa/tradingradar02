class Follower < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauthable, :omniauth_providers => [:facebook]
         
  #devise :omniauthable, :omniauth_providers => [:facebook]
  
  
  def self.new_with_session(params, session)
    super.tap do |follower|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        follower.email = data["email"] if follower.email.blank?
      end
    end
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |follower|
      follower.email = auth.info.email
      follower.password = Devise.friendly_token[0,20]
      follower.name = auth.info.name   # assuming the user model has a name
      follower.image = auth.info.image # assuming the user model has an image
    end
  end

end
