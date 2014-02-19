class CommentsController < ApplicationController

  def create
   @comment = Comment.new(comment_params)
   if @comment.save
     render :json => @comment
   else
     render :json => @comment.errors.full_messages,
     :status => :unprecessable_entity
   end
  end

  def destroy
    get_comment
    @comment.destroy
    render :json => @comment
  end

  def index
    user_groups = Comment.comments_for_user_id(params[:user_id])
    render :json => user_groups
  end

  def show
    get_comment
    render :json => @comment
  end

  def update
    get_comment
    if @comment.update_attributes(comment_params)
      render :json => @comment
    else
      render :json => @comment.errors.full_messages,
      :status => :unprecessable_entity
    end

  end

  private
  def get_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:contact_group).permit(:user_id)
  end
end
