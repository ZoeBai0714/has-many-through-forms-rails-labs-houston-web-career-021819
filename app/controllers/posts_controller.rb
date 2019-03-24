class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @uniq_users = []
    @post.comments.each do |coment|
    @uniq_users << coment.user
    end
    @uniq_users = @uniq_users.uniq
    @comment = Comment.new 
  end 

  def index
    @posts = Post.all 
  end

  def new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
