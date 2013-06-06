class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]

    if user = User.where(uid: auth["uid"])
    else
      User.create_with_omniauth auth
    end

    redirect_to root_path
  end
end
