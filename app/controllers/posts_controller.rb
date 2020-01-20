class PostsController < ApplicationController
    def create
        post = Post.create(post_params)

        if post.valid?
            render json: post
        else
            render json: {errors: post.error.full_messages}, status: :unauthorized
        end
    end


    private
    def post_params
        params.require(:post).permit(:title, :content, :user_id)
    end
end
