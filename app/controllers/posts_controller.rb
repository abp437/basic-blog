class PostsController < ApplicationController
  before_action :find_post_by_id, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      # This redirection redirects to the `show` action of this controller
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path
    else
      redirect_to @post
    end
  end

  private

  def post_params
    # Whenever we receive a request we receive it in the form of symbols
    # So, that's why we get these params as symbols
    params.require(:post).permit(:title, :content)
  end

  def find_post_by_id
    # Here we are setting the instance variable to be used in the view file
    # This variable is also available in the actions which use this callback function
    @post = Post.find(params[:id])
  end
end
