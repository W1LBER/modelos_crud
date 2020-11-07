class PostsController < ApplicationController

  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { @post }
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { @post }
    end
  end

  private
  def post_params 
    params.require(:post).permit(:content)
  end
end
