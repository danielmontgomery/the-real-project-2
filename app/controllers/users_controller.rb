class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.all
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
  end

end
