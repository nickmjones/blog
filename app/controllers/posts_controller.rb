class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  def index
    if params[:tag]
      @posts = Post.is_published.tagged_with(params[:tag]).order('created_at DESC').page params[:page]
    else
      @posts = Post.is_published.order('created_at DESC').page params[:page]
    end
  end

  def show
  end

  def edit
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "Post created."
    else
      render 'new'
    end
  end

  def update
    @post = Post.friendly.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: "Post updated."
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.friendly.find(params[:id])
    @post.destroy
    redirect_to root_path, notice: "Post deleted."
  end

  def drafts
    @drafts = Post.is_draft.order('created_at DESC').page params[:page]
  end

  def sent
    @sents = Post.is_published.order('created_at DESC').page params[:page]
  end

  private

    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :is_draft, :slug, :tag_list)
    end
  
end