class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    # :userはreq.bodyのようなもの
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def user_params
    # 対象となるparameterを選択する
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
