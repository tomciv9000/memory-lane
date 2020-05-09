class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
  
  
    def index
      @users = User.all
      render json: UserSerializer.new(@users)
    end
  
    
    def show
      render json: UserSerializer.new(@user)
    end
  
    
    def create
      @user = User.new(user_params)
  
      if @user.save
        render json: UserSerializer.new(@user)

      else
        render json: @user.errors, status: :unprocessable_entity
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
