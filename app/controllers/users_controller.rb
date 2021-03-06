class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザを登録しました"
      redirect_to login_path
    else
      flash.now[:danger] = "ユーザを登録できませんでした"
      render :new
    end
  end

  def new
    @user = User.new
  end
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
