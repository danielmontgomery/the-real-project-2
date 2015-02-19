class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
  	puts "=========================================="
  	puts params.inspect
  	puts "=========================================="
    u = User.where(username: params[:user][:username]).first
    if u != nil && u.authenticate(params[:user][:password])
      session["user_id"] = u.id.to_s
      redirect_to pictures_path(user_id: u.id)
    else
      redirect_to new_sessions_path
    end
  end

  def destroy
    session.destroy
    redirect_to pictures_path
  end
end
