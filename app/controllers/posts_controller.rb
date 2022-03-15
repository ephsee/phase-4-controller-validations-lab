class PostsController < ApplicationController

  # rescue_from ActiveRecord::RecordInvalid, with: render_unprocessable_entity

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    if post.valid?
      render json: post, status: :ok
    else
      render json: {errors: post.errors}, status: :unprocessable_entity
    end

  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  # def render_unprocessable_entity(invalid)
  #   render json: {errors: invalid.record.errors}, status: :unprocessable_entity
  # end

end
