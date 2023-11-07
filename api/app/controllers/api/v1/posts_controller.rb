class Api::V1::PostsController < ApplicationController
    before_action :set_post, only:[:show, :edit, :update, :destroy]
    
    def index
        posts = Post.includes(:user).order(created_at: :desc)
        render json: posts.as_json(include: { user: { only: [:id, :name, :image] } },
        methods: :formatted_created_at)
    end

    def create
        @post = current_user.posts.create(post_params)
            if @post.save
                render json: @post
            else
                render json: @post.erros, status: 422
            end
    end

    def show
        hoge = current_user&.id === @post.user_id
        render json: @post.as_json(methods: [:formatted_created_at, :formatted_updated_at]).merge(hoge: hoge)
    end

    def update
        if @post.update(post_params)
            render json: @post
        else
            render json: @post.erros, status: 422
        end
    end

    private 
    def post_params
        params.require(:post).permit(:title, :content,)
    end

    def set_post
        @post = Post.find(params[:id])
    end

end
