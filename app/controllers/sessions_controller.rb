class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]

    if user = User.where(uid: auth["uid"]).first
    else
      user = User.create_with_omniauth auth
    end

    session[:user_id] = user.id

    redirect_to root_path
  end
end
