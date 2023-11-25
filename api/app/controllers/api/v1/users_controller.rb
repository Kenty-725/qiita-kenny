class Api::V1::UsersController < ApplicationController

    def me
        begin
          @user = User.find(current_user&.id)
          user_data = @user.attributes
          user_data[:icon_url] = rails_blob_url(@user.icon) if @user.icon.attached?
        rescue ActiveRecord::RecordNotFound
          return render json: { error: 'ユーザー情報が存在しません' }, status: 404
        end
      
        render json: user_data
      end
      
    def update
        begin
          @user = User.find(current_user.id)
          if @user.update(user_params)
            render json: @user
          else
            render json: { error: '更新に失敗しました' }, status: 422
          end
        rescue StandardError => e
          render json: { error: 'サーバーエラーが発生しました' }, status: 500
        end
      end
    def user_params
        params.require(:user).permit(:name, :email, :profile_text, :icon)
    end
end