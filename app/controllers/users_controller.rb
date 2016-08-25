class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash[:danger] = t "page.user_nil"
      redirect_to root_path
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "page.register.sign_up_successful"
      redirect_to @user
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end