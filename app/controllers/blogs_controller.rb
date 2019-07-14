class BlogsController < ApplicationController
  before_action :move_to_index, except: [:index,:show]

  def index
    @blogs =Blog.order("created_at DESC").page(params[:page]).per(5)
    @like = Like.new
    # @blogs =Blog.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @blog = Blog.new
    @tag  = Tag.new
  end

  def create
    @blog = Blog.create(blog_params)
    if @blog.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @blog = Blog.find(params[:id])
    @tag  = Tag.new
  end

  def show
    @blog =Blog.find(params[:id])
    @like = Like.new
  end

  def update
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.update(blog_params)
    end

    if blog.update(blog_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy if blog.user_id == current_user.id
  end







  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end


  private

  def blog_params
    # params.permit(:content).merge(user_id: current_user.id)
    params.require(:blog).permit(:content,:title,{ tag_ids: [] }).merge(user_id: current_user.id, )
  end

  




end
