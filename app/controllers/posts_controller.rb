class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]


  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Post created"
      redirect_to root_path
    else
      flash[:alert] = "Please enter both title and content"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params 
    params.require(:post).permit(:title, :content, :user_id)
  end
end
