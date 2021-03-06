class Followers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @follower = Follower.from_omniauth(request.env["omniauth.auth"])

    if @follower.persisted?
      sign_in_and_redirect @follower, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_follower_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end