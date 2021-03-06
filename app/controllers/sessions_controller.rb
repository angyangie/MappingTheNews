class SessionsController < ApplicationController
before_action :set_user, only: [:show, :edit, :update]

  def new
  end

  def create
   @user = User.find_by(email: params[:user][:email])
     if @user && @user.authenticate(params[:user][:password])
       session[:user_id] = @user.id
       redirect_to home_path(@user)
     else
      flash[:message] = "You have entered the wrong email or password. Please try again."
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user_id
    flash[:message] = "You have successfully logged out."
    redirect_to login_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end


end
