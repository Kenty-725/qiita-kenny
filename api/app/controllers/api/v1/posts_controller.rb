class Api::V1::PostsController < ApplicationController
    # before_action :only:[:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    def index
        posts = Post.includes(:user).order(created_at: :desc)
        # render json: posts.as_json(include: { user: { only: [:id,  :name, :image] } })
        render json: posts.as_json(include: { user: { only: [:id, :name, :image] } },
        methods: :formatted_date)
    end

    def create
        @post = current_user.posts.create(post_params)
            if @post.save
                render json: @post
            else
                render json: @post.erros, status: 422
            end
    end

    private 
    def post_params
        params.require(:post).permit(:title, :content,)
    end

end
