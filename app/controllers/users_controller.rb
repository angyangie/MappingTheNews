class UsersController < ApplicationController
 before_action :set_user, :except => [:index, :new, :create]

  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if !@user.save
      flash[:errors] = []
      flash[:message] = "Please fix the following errors"
      @user.errors.each do |k,v|
        flash[:errors] << "#{k}: #{v}"
      end
      render :new
    else 
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

   def show 
    @user = User.find(session[:user_id])
  end

  def index 
    @users = User.find(session[:user_id])
  end

  def edit
  end

  def update 
    @user = User.find(session[:user_id])
    if !@user.update(user_params)
          flash[:errors] = []
          flash[:message] = "Please fix the following errors:"
          @user.errors.each do |k,v|
              flash[:errors] << "#{k}: #{v}"
          end
          render :edit
        else
            redirect_to @user
        end
  end

  private
  
  def set_user
    @user = User.find(session[:user_id])
  end

  def user_params
    params.require(:user).permit(:user_id, :first_name, :last_name, :email, :password, :password_confirmation)
  end

end
  
