class Api::V1::UsersController < ApplicationController

    def me
        @user = User.find(current_user.id)
        render json: @user
    end

    def update
        @user = User.find(current_user.id)
        @user.update(user_params)
        render json: @user
    end

    def user_params
        params.require(:user).permit(:name, :email, :profile_text)
    end
end