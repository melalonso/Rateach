class UsersController < ApplicationController
    
    before_action :authenticate_user!
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        @user.manager=true
        @user.save
    end
    
    def edit
    end
    
    def update
    end


    
    private
    def user_params
       params.require(:user).permit(:title, :summary, :body) 
    end
end