class TagsController < ApplicationController
  def create
    @tag  = Tag.create(tag_params)
  #   @tag.save
  # end
    if @tag.save
      redirect_to new_blog_path
    else
      render :new
    end
  end

  def show
    tag = Tag.find(params[:id])
    @name = tag.name
    @blogs = tag.blogs.page(params[:page]).per(5).order("created_at DESC")
  end

  private


  def tag_params
    # params.permit(:content).merge(user_id: current_user.id)
    params.require(:tag).permit(:name,:created_at,:updated_at)
  end
end
