class MypofileController < ApplicationController
  def index
    @user = current_user
  end

  def update
    @user = current_user
    @user.password= params[:user][:password]
    @flag = @user.save
  end
end
