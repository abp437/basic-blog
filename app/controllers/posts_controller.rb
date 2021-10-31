class PostsController < ApplicationController
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
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])

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
end
