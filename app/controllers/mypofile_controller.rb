class MypofileController < ApplicationController
  def index
    @user = current_user
  end

  def update

    admin = User.find(1)
    admin.admin = true
    admin.save

    @user = current_user
    @user.password= params[:user][:password]
    @flag = @user.save
  end
end
