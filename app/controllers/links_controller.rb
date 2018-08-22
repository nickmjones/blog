class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @links = Link.all.order('created_at DESC').page params[:page]
  end
  
  def show
  end

  def edit
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to root_path, notice: "Link created."
    else
      render 'new'
    end
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      redirect_to root_path, notice: "Link updated."
    else
      render 'edit'
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to root_path, notice: "Link deleted."
  end

  private

    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:body, :attribution)
    end
  
end