class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update]

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
