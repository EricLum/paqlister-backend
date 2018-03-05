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
    user = User.find(token_user_id)
    if user
      render json: {id: user.id, username: user.username }
    else
      render json: {error: "You done goofed"}, status: 401
    end
  end

  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      render json: {token: issue_token({id: user.id}),
                    user: user}
    else
      render json: {error: 'No user found'}
    end
  end
end
