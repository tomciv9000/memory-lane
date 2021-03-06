class AuthController < ApplicationController
    skip_before_action :require_login, only: [:create]

  #def create
  #  @user = User.find_by(username: user_login_params[:username])
  #  #User#authenticate comes from BCrypt
  #  if @user && @user.authenticate(user_login_params[:password])
  #    # encode token comes from ApplicationController
  #    token = encode_token({ user_id: @user.id })
  #    render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
  #  else
  #    render json: { message: 'Invalid username or password' }, status: :unauthorized
  #  end
  #end

  def login 
    @user = User.find_by(username: user_login_params[:username])
    if @user && @user.authenticate(user_login_params[:password])
      payload = {user_id: @user.id}
      token = encode_token(payload)
      render json: { user: UserSerializer.new(@user), jwt: token, success: "Welcome back, #{@user.username}" }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def auto_login
    if session_user
      render json: session_user
    else
      render json: {errors: "No User Logged In"}
    end
  end
  

  def user_is_authed
    render json: {message: "You are authorized"}
  end

  private

  def user_login_params
    # params { user: {username: 'Chandler Bing', password: 'hi' } }
    params.require(:user).permit(:username, :password)
  end
  
end
