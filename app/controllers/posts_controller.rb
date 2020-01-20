class PostsController < ApplicationController

    before_action :authorized_action

    def create
        post = Post.create(post_params)
        post.update(user: @current_user)

        if post.valid?
            render json: post
        else
            render json: {errors: post.error.full_messages}, status: :unauthorized
        end
    end


    private
    def post_params
        params.require(:post).permit(:title, :content)
    end

    def authorized_action
        if !logged_in?
            render json: {erros:'You must be a registered user.'}, #status: :not_acceptable
            status: :unauthorized
        end
    end
end
