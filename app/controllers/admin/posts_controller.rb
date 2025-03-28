module Admin
    class PostsController < ApplicationController
      before_action :require_authentication, :require_admin

      def new
        @post = Post.new
      end

      def create
        @post = Post.new(post_params)
        if @post.save
          redirect_to posts_path, notice: "Post was successfully created."
        else
          render :new, status: :unprocessable_entity
        end
      end

      private

      def post_params
        params.require(:post).permit(:title, :body, :banner_image)
      end

      def require_admin
        unless Current.session&.user&.admin?
          redirect_to root_path, alert: "You are not authorized to access this page."
        end
      end
    end
  end