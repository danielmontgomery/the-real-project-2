class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @currentUser = User.where(id: session["user_id"]).first

  end

  def new
    @user = User.new
  end

  def create
    user = User.new(params.require(:user).permit(:username, :avatar, :password, :password_digest))
    if user.save
      session['user_id'] = user.id.to_s
      redirect_to pictures_path
    else
      redirect_to new_user_path
    end
  end

  def edit
  end

  def destroy
    @user = User.where(id: params[:id]).first
    @user.destroy
    redirect_to users_path
  end

end
