class SessionsController < ApplicationController
  def create
    session[:user_name] = request.env["omniauth.auth"]["info"]["name"]

    redirect_to root_path
  end
end
