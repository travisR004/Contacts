class UsersController < ApplicationController


  def create
   @user = User.new(user_params)
   if @user.save
     render :json => @user
   else
     render :json => @user.errors.full_messages,
     :status => :unprecessable_entity
   end
  end

  def destroy
    get_user
    @user.destroy
    render :json => @user
  end

  def index
    render :json => User.all
  end

  def show
    get_user
    render :json => @user
  end

  def update
    get_user
    if @user.update_attributes(user_params)
      render :json => @user
    else
      render :json => @user.errors.full_messages,
      :status => :unprecessable_entity
    end

  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username)
  end
end
