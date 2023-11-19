class Api::V1::UsersController < ApplicationController

    def me
        @user = User.find(current_user.id)
        render json: @user
    end
end