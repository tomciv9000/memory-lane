class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
    before_action :set_user, only: [:show, :update, :destroy]
  
  
    def index
      @users = User.all
      render json: UserSerializer.new(@users)
    end

    def profile
      render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end
  
    
    def show
      render json: UserSerializer.new(@user)
    end
  
    
    def create
      @user = User.create(user_params)
      if @user.valid?
        @token = encode_token({ user_id: @user.id })
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    end
  
    
    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
   
    def destroy
      unless @user.nil?
        @user.destroy
        render json: @user
      else
        render json: { error: "user not Found!" }, status: 404
      end
    end

  
    private
      
      def set_user
        @user = User.find(params[:id])
      end
  
      
      def user_params
        params.require(:user).permit(:username, :password)
      end

end
