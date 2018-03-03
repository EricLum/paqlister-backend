class Api::V1::AuthController < ApplicationController

  def show
    user = User.find_by(username: params["username"])

    if user && user.authenticate(params[:password])
      render json: {id: user.id, username: user.username}
    else
      render json: {error: "You done goofed"}, status: 401
    end
  end

  def currentUser
    token = request.headers['Authorization']
    user = User.find(token)
    if user
      render json: {id: user.id, username: user.username }
    else
      render json: {error: "You done goofed"}, status: 401
    end
  end

  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(password[:password])
      issue_token({id: user.id})
    end
end
